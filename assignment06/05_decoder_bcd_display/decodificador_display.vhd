-- Bibliotecas
library IEEE; -- Vou usar essa biblioteca IEEE
use IEEE.STD_LOGIC_1164.ALL; -- Vou usar esse pacote STD_LOGIC_1164
use IEEE.NUMERIC_STD.ALL;

entity decodificador_display is
Port (  I : in std_logic_vector(3 downto 0);
        S : out std_logic_vector(6 downto 0)   );
end decodificador_display;

-- Comportamento da Entitade
architecture Behavioral of decodificador_display is
begin

    WITH I SELECT
        S <=    "1111110" WHEN "0000",
                "0110000" WHEN "0001",
                "1101101" WHEN "0010",
                "1111001" WHEN "0011",
                "0110011" WHEN "0100",
                "1011011" WHEN "0101",
                "1011111" WHEN "0110",
                "1110000" WHEN "0111",
                "1111111" WHEN "1000",
                "1111011" WHEN "1001",
                "1110111" WHEN "1010",
                "0011111" WHEN "1011",
                "1001110" WHEN "1100",
                "0111101" WHEN "1101",
                "1001111" WHEN "1110",
                "1000111" WHEN "1111",
                "0000000" WHEN OTHERS;
    
end Behavioral;
