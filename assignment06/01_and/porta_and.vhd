-- Bibliotecas
library IEEE; -- Vou usar essa biblioteca IEEE
use IEEE.STD_LOGIC_1164.ALL; -- Vou usar esse pacote STD_LOGIC_1164

-- Nome da Entidade & Portas de E/S
entity porta_and is -- Será a entidade porta_and
Port (  A : in std_logic;
        B : in std_logic;
        C : out std_logic   );
end porta_and; -- Delimita o final da descrição

-- Comportamento da Entitade
architecture Behavioral of porta_and is
begin
    C <= A and B;
end Behavioral;
