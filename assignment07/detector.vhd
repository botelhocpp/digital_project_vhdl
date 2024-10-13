LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY PROJECT;
USE PROJECT.DEFS.ALL;

ENTITY detector IS
PORT (
    A : IN STD_LOGIC;
    clk : IN STD_LOGIC;
    posedge : OUT STD_LOGIC
);
END detector;

ARCHITECTURE rtl OF detector IS
    SIGNAL data : STD_LOGIC := '0';
BEGIN
    posedge <= (NOT data) AND A;

    PROCESS(clk)
    BEGIN
        IF(RISING_EDGE(clk)) THEN
            data <= A;
        END IF;
    END PROCESS;
END rtl;
