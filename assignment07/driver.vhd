LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY PROJECT;
USE PROJECT.DEFS.ALL;

ENTITY driver IS
PORT (
    cnt : IN byte;
    clk : IN STD_LOGIC;
    j1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    j2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END driver;

ARCHITECTURE rtl OF driver IS
    SIGNAL data : STD_LOGIC := '0';
    SIGNAL count : INTEGER RANGE 0 TO 50000 := 0;
    SIGNAL sel : STD_LOGIC := '0';
    SIGNAL ssd1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL ssd2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
    -- Select display
    j2(3) <= sel;

    -- Decode hex to SSD
    ssd1 <= hex2ssd(cnt(7 DOWNTO 4));
    ssd2 <= hex2ssd(cnt(3 DOWNTO 0));
    
    -- Control SSD
    j1(0) <= ssd1(0) WHEN (sel = '0') ELSE ssd2(0);
    j1(1) <= ssd1(1) WHEN (sel = '0') ELSE ssd2(1);
    j1(2) <= ssd1(2) WHEN (sel = '0') ELSE ssd2(2);
    j1(3) <= ssd1(3) WHEN (sel = '0') ELSE ssd2(3);
    j2(0) <= ssd1(4) WHEN (sel = '0') ELSE ssd2(4);
    j2(1) <= ssd1(5) WHEN (sel = '0') ELSE ssd2(5);
    j2(2) <= ssd1(6) WHEN (sel = '0') ELSE ssd2(6);
    
    -- Counting logic
    PROCESS(clk)
    BEGIN
        IF(RISING_EDGE(clk)) THEN
            IF(count = 0) THEN
                sel <= NOT sel;
            END IF;
            count <= count + 1;
        END IF;
    END PROCESS;
END rtl;
