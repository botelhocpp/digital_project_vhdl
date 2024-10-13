LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY keyboard IS
    PORT(
        clk, ps2_clk: IN STD_LOGIC;
        data: IN STD_LOGIC;
        word : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        V0 : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE rtl OF keyboard IS
-- architecture declaration - 2 states - idle and reading - state s starts with idle - the read word has no characters - the registered word
-- contains no information - signals sI and sR are two repeated signals that help delay 1 clock pulse for v0 signal
    TYPE states IS (I, R);
    SIGNAL s: states := I;
    SIGNAL count: integer := 0;
    SIGNAL word_register: std_logic_vector(7 DOWNTO 0) := "00000000";
    SIGNAL sI, sR: std_logic := '0';

BEGIN
    word <= word_register;

    PROCESS(ps2_clk)
    BEGIN  
        IF (falling_edge(ps2_clk)) THEN
            CASE s IS
                WHEN I =>
                    sI <= '0';
                    IF data = '0' THEN
                        count <= 0;
                        s <= R;
                    END IF;
                
                WHEN R =>
                    IF count < 8 THEN
                        word_register(count) <= data;
                        count <= count + 1;
                    ELSE
                        sI <= '1'; --indicates that the entire word was read
                        s <= I;
                    END IF;
            END CASE;
        END IF;
    END PROCESS;

    PROCESS(clk)
    BEGIN
        IF rising_edge(clk) THEN
            sR <= sI; -- 1 clock pulse delayed result due to this attribution
            V0 <= sI and not sR; -- will only be 1 when sI is activated (finished reading word) and sR is not (indicates that the system started and finished reading a word)
        END IF;
    END PROCESS;

END ARCHITECTURE;
