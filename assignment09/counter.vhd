LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY PROJECT;
USE PROJECT.DEFS.ALL;

ENTITY counter IS
GENERIC ( N : INTEGER := 8 );
PORT (
    up : IN STD_LOGIC;
    down : IN STD_LOGIC;
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    cnt : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0)
);
END counter;

ARCHITECTURE rtl OF counter IS
    SIGNAL count : UNSIGNED(N - 1 DOWNTO 0) := (OTHERS => '0'); 
BEGIN
    cnt <= STD_LOGIC_VECTOR(count);
    
    PROCESS(clk)
    BEGIN
        IF(rst = '1') THEN
            count <= (OTHERS => '0');
        ELSIF(RISING_EDGE(clk)) THEN
            IF(up = '1') THEN
                count <= count + 1;
            ELSIF(down = '1') THEN
                count <= count - 1;
            END IF;
        END IF;
    END PROCESS;
END rtl;
