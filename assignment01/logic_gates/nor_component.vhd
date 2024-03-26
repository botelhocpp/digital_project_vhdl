library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor_component is
    Port ( clk : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end nor_component;

architecture nor_rtl of nor_component is
begin
    process
    begin
        wait until clk'event and clk = '1';
        
        if(a = '0' and b = '0')then
            x <= '1';
        else
            x <= '0';
        end if;
    end process;

end nor_rtl;
