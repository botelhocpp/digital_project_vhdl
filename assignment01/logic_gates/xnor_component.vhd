library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xnor_component is
    Port ( clk : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end xnor_component;

architecture xnor_rtl of xnor_component is
begin
    process
    begin
        wait until clk'event and clk = '1';
        
        if(a = b)then
            x <= '1';
        else
            x <= '0';
        end if;
    end process;

end xnor_rtl;
