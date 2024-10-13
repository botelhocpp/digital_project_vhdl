LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY PROJECT;
USE PROJECT.DEFS.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behaviour OF testbench IS
    COMPONENT pulse_counter IS
    PORT (
        btn_north : IN STD_LOGIC;
        btn_south : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        j1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        j2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
    END COMPONENT;
    
    -- Common Signals
    SIGNAL btn_north : STD_LOGIC := '0';
    SIGNAL btn_south : STD_LOGIC := '0';
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL j1 : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL j2 : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    
BEGIN
    PULSE_COUNTER1 : pulse_counter PORT MAP (
        btn_north => btn_north,
        btn_south => btn_south,
        clk => clk,
        j1 => j1,
        j2 => j2
    );
    
    clk <= NOT clk AFTER 20ns/2;
    
    PROCESS
    BEGIN
        btn_north <= '1';
        WAIT FOR 20ns;
        
        btn_north <= '0';
        WAIT FOR 20ns;
        
        btn_north <= '1';
        WAIT FOR 20ns;
    END PROCESS;
END behaviour;
