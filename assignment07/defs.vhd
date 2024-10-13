LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

PACKAGE defs IS 
    SUBTYPE nibble IS STD_LOGIC_VECTOR(3 DOWNTO 0);  
    SUBTYPE byte IS STD_LOGIC_VECTOR(7 DOWNTO 0);  
    
    FUNCTION hex2ssd(hex : nibble) RETURN STD_LOGIC_VECTOR;
END defs;

PACKAGE BODY defs IS 
    FUNCTION hex2ssd(hex : nibble) RETURN STD_LOGIC_VECTOR IS
        VARIABLE ssd : STD_LOGIC_VECTOR(6 DOWNTO 0) := (OTHERS => '0');
    BEGIN
        CASE TO_INTEGER(UNSIGNED(hex)) IS
            WHEN 0 => ssd := "0111111";
            WHEN 1 => ssd := "0000110";
            WHEN 2 => ssd := "1011011";
            WHEN 3 => ssd := "1001111";
            WHEN 4 => ssd := "1100110"; 
            WHEN 5 => ssd := "1101101";
            WHEN 6 => ssd := "1111101";
            WHEN 7 => ssd := "0000111";
            WHEN 8 => ssd := "1111111";
            WHEN 9 => ssd := "1100111";
            WHEN 10 => ssd := "1110111";
            WHEN 11 => ssd := "1111100";
            WHEN 12 => ssd := "0111001";
            WHEN 13 => ssd := "1011110";
            WHEN 14 => ssd := "1111001";
            WHEN 15 => ssd := "1110001";
        END CASE;
        
        RETURN ssd;
    END FUNCTION;
END defs;
