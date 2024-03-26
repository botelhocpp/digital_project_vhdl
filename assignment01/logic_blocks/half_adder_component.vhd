library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder_component is
    Port ( clk : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           s : out STD_LOGIC;
           c : out STD_LOGIC);
end half_adder_component;

architecture half_adder_rtl of half_adder_component is
begin
    process
    begin
        wait until clk'event and clk = '1';
        
        if(a = '1' xor b = '1')then
            s <= '1';
            c <= '0';
        elsif(a = b) then
            s <= '0';
            c <= a;
        end if;
        
    end process;

end half_adder_rtl;
