LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY work;
USE work.DEFS.ALL;

ENTITY driver IS
PORT (
    cnt : IN byte;
    CLK_50MHZ : IN STD_LOGIC;
    J1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    J2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
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
    J2(3) <= sel;

    -- Decode hex to SSD
    ssd1 <= hex2ssd(cnt(3 DOWNTO 0));
    ssd2 <= hex2ssd(cnt(7 DOWNTO 4));
    
    -- Control SSD
    J1(0) <= ssd1(0) WHEN (sel = '0') ELSE ssd2(0);
    J1(1) <= ssd1(1) WHEN (sel = '0') ELSE ssd2(1);
    J1(2) <= ssd1(2) WHEN (sel = '0') ELSE ssd2(2);
    J1(3) <= ssd1(3) WHEN (sel = '0') ELSE ssd2(3);
    J2(0) <= ssd1(4) WHEN (sel = '0') ELSE ssd2(4);
    J2(1) <= ssd1(5) WHEN (sel = '0') ELSE ssd2(5);
    J2(2) <= ssd1(6) WHEN (sel = '0') ELSE ssd2(6);
    
    -- Counting logic
    PROCESS(CLK_50MHZ)
    BEGIN
        IF(RISING_EDGE(CLK_50MHZ)) THEN
            IF(count = 0) THEN
                sel <= NOT sel;
            END IF;
            count <= count + 1;
        END IF;
    END PROCESS;
END rtl;
