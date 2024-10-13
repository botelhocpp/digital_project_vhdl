LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY PROJECT;
USE PROJECT.DEFS.ALL;

ENTITY driver IS
PORT (
    value : IN byte;
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    j1 : OUT nibble;
    j2 : OUT nibble
);
END driver;

ARCHITECTURE rtl OF driver IS
    SIGNAL refresh_clk : STD_LOGIC := '0';
    SIGNAL data : STD_LOGIC := '0';
    SIGNAL ssd1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL ssd2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
    PRESCALER_COMP: ENTITY WORK.prescaler
    GENERIC MAP ( N => 250000 )
    PORT MAP (
        clk => clk,
        rst => rst,
        output_clk => refresh_clk
    );

    -- Decode hex to SSD
    ssd1 <= hex2ssd(value(7 DOWNTO 4));
    ssd2 <= hex2ssd(value(3 DOWNTO 0));
    
    -- Control SSD
    j1(0) <= ssd1(0) WHEN (refresh_clk = '0') ELSE ssd2(0);
    j1(1) <= ssd1(1) WHEN (refresh_clk = '0') ELSE ssd2(1);
    j1(2) <= ssd1(2) WHEN (refresh_clk = '0') ELSE ssd2(2);
    j1(3) <= ssd1(3) WHEN (refresh_clk = '0') ELSE ssd2(3);
    j2(0) <= ssd1(4) WHEN (refresh_clk = '0') ELSE ssd2(4);
    j2(1) <= ssd1(5) WHEN (refresh_clk = '0') ELSE ssd2(5);
    j2(2) <= ssd1(6) WHEN (refresh_clk = '0') ELSE ssd2(6);

    -- Select display
    j2(3) <= refresh_clk;
END rtl;
