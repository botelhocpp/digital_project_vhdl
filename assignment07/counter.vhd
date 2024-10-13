LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY PROJECT;
USE PROJECT.DEFS.ALL;

ENTITY counter IS
PORT (
    up : IN STD_LOGIC;
    down : IN STD_LOGIC;
    clk : IN STD_LOGIC;
    cnt : OUT byte
);
END counter;

ARCHITECTURE rtl OF counter IS
    SIGNAL count : INTEGER RANGE 0 TO 255 := 0; 
BEGIN
    cnt <= byte(TO_UNSIGNED(count, 8));
    
    PROCESS(clk)
    BEGIN
        IF(RISING_EDGE(clk)) THEN
            IF(up = '1') THEN
                count <= count + 1;
            ELSIF(down = '1') THEN
                count <= count - 1;
            END IF;
        END IF;
    END PROCESS;
END rtl;
