library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_component is
    Port ( clk : in STD_LOGIC;
           a : in STD_LOGIC;
           x : out STD_LOGIC);
end not_component;

architecture not_rtl of not_component is
begin
    process
    begin
        wait until clk'event and clk = '1';
        
        if (a='1') then
            x <= '0';
        else
            x <= '1';
         end if;
    end process;

end not_rtl;
