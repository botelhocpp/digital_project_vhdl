library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity buffer_component is
    Port ( clk : in STD_LOGIC;
           a : in STD_LOGIC;
           x : out STD_LOGIC);
end buffer_component;

architecture buffer_rtl of buffer_component is
begin
    process
    begin
        wait until clk'event and clk = '1';
        
        x <= a;
        
    end process;

end buffer_rtl;
