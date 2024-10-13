LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY PROJECT;
USE PROJECT.DEFS.ALL;

ENTITY pulse_meter IS
PORT (
    start : IN STD_LOGIC;
    stop : IN STD_LOGIC;
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    period : OUT byte
); 
END pulse_meter;

ARCHITECTURE rtl OF pulse_meter IS
    SIGNAL count_up : STD_LOGIC := '0';
    SIGNAL count_clk : STD_LOGIC := '0';
BEGIN
    COUNTER_COMP: ENTITY WORK.counter
    GENERIC MAP ( N => 8 )
    PORT MAP (
        up => count_up,
        down => '0',
        clk => count_clk,
        rst => rst,
        cnt => period
    );
    PRESCALER_COMP: ENTITY WORK.prescaler
    PORT MAP (
        clk => clk,
        rst => rst,
        output_clk => count_clk
    );
    
    PROCESS(clk, rst)
    BEGIN
        IF (rst = '1') THEN
            count_up <= '0';
        ELSIF (RISING_EDGE(clk)) THEN
            IF (start = '1') THEN
                count_up <= '1';
            ELSIF (stop = '1') THEN
                count_up <= '0';
            END IF;
        END IF;
    END PROCESS;
END rtl;
