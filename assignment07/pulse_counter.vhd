LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY PROJECT;
USE PROJECT.DEFS.ALL;

ENTITY pulse_counter IS
PORT (
    btn_north : IN STD_LOGIC;
    btn_south : IN STD_LOGIC;
    clk : IN STD_LOGIC;
    j1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    j2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END pulse_counter;

ARCHITECTURE rtl OF pulse_counter IS
    COMPONENT detector IS
    PORT (
        A : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        posedge : OUT STD_LOGIC
    );
    END COMPONENT;
    
    COMPONENT counter IS
    PORT (
        up : IN STD_LOGIC;
        down : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        cnt : OUT byte
    );
    END COMPONENT;
    
    COMPONENT driver IS
    PORT (
        cnt : IN byte;
        clk : IN STD_LOGIC;
        j1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        j2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
    END COMPONENT;
    
    SIGNAL btn_north_edge : STD_LOGIC;
    SIGNAL btn_south_edge : STD_LOGIC;
    SIGNAL cnt : byte;
BEGIN
    DETECTOR1 : detector PORT MAP (
        A => btn_north,
        clk => clk,
        posedge => btn_north_edge
    );
    DETECTOR2 : detector PORT MAP (
        A => btn_south,
        clk => clk,
        posedge => btn_south_edge
    );
    COUNTER1 : counter PORT MAP (
        up => btn_north_edge,
        down => btn_south_edge,
        clk => clk,
        cnt => cnt
    );
    DRIVER1 : driver PORT MAP (
        cnt => cnt,
        clk => clk,
        j1 => j1,
        j2 => j2
    );
END rtl;
