LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY prescaler IS
    GENERIC( N : INTEGER := 1562500 );
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        output_clk : OUT STD_LOGIC
    );
END prescaler;

ARCHITECTURE hardware OF prescaler IS 
    SIGNAL counter : INTEGER RANGE 0 TO N := 0;
    SIGNAL generated_clk : STD_LOGIC := '0';
BEGIN 
    output_clk <= generated_clk;
    
    PROCESS(clk, rst)
    BEGIN
        IF(rst = '1') THEN
            counter <= 0;
            generated_clk <= '0';
        ELSIF(RISING_EDGE(clk)) THEN 
            IF(counter = N) THEN
                counter <= 0;
                generated_clk <= NOT generated_clk;
            ELSE
                counter <= counter + 1;
            END IF;
        END IF;
    END PROCESS;
END hardware;
