-- Bibliotecas
library IEEE; -- Vou usar essa biblioteca IEEE
use IEEE.STD_LOGIC_1164.ALL; -- Vou usar esse pacote STD_LOGIC_1164
use IEEE.NUMERIC_STD.ALL;

entity decodificador_3_8 is
Port (  I : in std_logic_vector(2 downto 0); -- barramento de 3 bits
        S : out std_logic_vector(7 downto 0)   );  -- barramento de 8 bits
end decodificador_3_8;

-- Comportamento da Entitade
architecture Behavioral of decodificador_3_8 is
begin

    WITH I SELECT
        S <=    "00000001" WHEN "000",
                "00000010" WHEN "001",
                "00000100" WHEN "010",
                "00001000" WHEN "011",
                "00010000" WHEN "100",
                "00100000" WHEN "101",
                "01000000" WHEN "110",
                "10000000" WHEN "111",
                "00000000" WHEN OTHERS;
    
end Behavioral;
