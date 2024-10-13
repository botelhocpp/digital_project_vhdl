LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY PROJECT;
USE PROJECT.DEFS.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE Behavioral OF testbench IS
    CONSTANT CLK_PERIOD : TIME := 20ns;
    CONSTANT COUNT_CLK_PERIOD : TIME := 62.5ms;
    
    -- Control Signals
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL rst : STD_LOGIC := '0';
    
    -- Intermediary Signals
    SIGNAL start_btn : STD_LOGIC := '0';
    SIGNAL start_pulse : STD_LOGIC := '0';
    SIGNAL stop_btn : STD_LOGIC := '0';
    SIGNAL stop_pulse : STD_LOGIC := '0';
    SIGNAL period : byte := (OTHERS => '0');
    SIGNAL frequency : byte := (OTHERS => '0');
    SIGNAL j1 : nibble := (OTHERS => '0');
    SIGNAL j2 : nibble := (OTHERS => '0');
BEGIN
    START_DETECTOR_COMP: ENTITY WORK.detector
    PORT MAP (
        A => start_btn,
        clk => clk,
        rst => rst,
        posedge => start_pulse
    );
    STOP_DETECTOR_COMP: ENTITY WORK.detector
    PORT MAP (
        A => stop_btn,
        clk => clk,
        rst => rst,
        posedge => stop_pulse
    );
    PULSE_METER_COMP: ENTITY WORK.pulse_meter
    PORT MAP (
        start => start_pulse,
        stop => stop_pulse,
        clk => clk,
        rst => rst,
        period => period
    );
    FP_INVERSE_COMP: ENTITY WORK.fixed_point_inverse
    PORT MAP (
        input_value => period,
        output_value => frequency
    );
    SSD_DRIVER_COMP: ENTITY WORK.driver
    PORT MAP (
        value => frequency,
        clk => clk,
        rst => rst,
        j1 => j1,
        j2 => j2
    );

    clk <= NOT clk AFTER CLK_PERIOD/2;

    PROCESS
    BEGIN
        rst <= '1';
        WAIT FOR CLK_PERIOD/4;
        
        rst <= '0';
        WAIT FOR CLK_PERIOD/4;
        
        start_btn <= '1';
        WAIT FOR 4*COUNT_CLK_PERIOD;
        
        stop_btn <= '1';
        WAIT;
    END PROCESS;
END Behavioral;
