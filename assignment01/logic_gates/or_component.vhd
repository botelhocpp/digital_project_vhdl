library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_component is
    Port ( clk : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end or_component;

architecture or_rtl of or_component is
begin
    process
    begin
        wait until clk'event and clk = '1';
        
        if(a = '0' and b = '0')then
            x <= '0';
        else
            x <= '1';
        end if;
    end process;

end or_rtl;
