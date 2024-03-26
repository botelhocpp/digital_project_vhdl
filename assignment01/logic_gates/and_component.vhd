library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_component is
    Port ( clk : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end and_component;

architecture and_rtl of and_component is
begin
    process
    begin
        wait until clk'event and clk = '1';
        
        if(a = '1' and b = '1')then
            x <= '1';
        else
            x <= '0';
        end if;
    end process;

end and_rtl;
