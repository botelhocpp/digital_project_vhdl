library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nand_component is
    Port ( clk : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end nand_component;

architecture nand_rtl of nand_component is
begin
    process
    begin
        wait until clk'event and clk = '1';
        
        if(a = '1' and b = '1')then
            x <= '0';
        else
            x <= '1';
        end if;
    end process;

end nand_rtl;
