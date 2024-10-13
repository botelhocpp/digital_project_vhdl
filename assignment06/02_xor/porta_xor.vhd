-- Bibliotecas
library IEEE; -- Vou usar essa biblioteca IEEE
use IEEE.STD_LOGIC_1164.ALL; -- Vou usar esse pacote STD_LOGIC_1164

-- Nome da Entidade & Portas de E/S
entity porta_xor is -- Será a entidade porta_xor
Port (  A : in std_logic;
        B : in std_logic;
        C : out std_logic   );
end porta_xor; -- Delimita o final da descrição

-- Comportamento da Entitade
architecture Behavioral of porta_xor is
begin
    C <= (A AND NOT B) OR (NOT A AND B);
end Behavioral;
