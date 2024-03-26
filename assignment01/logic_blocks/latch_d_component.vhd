library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity latch_d_component is
    Port ( clk : in STD_LOGIC;
           d : in STD_LOGIC;
           q : out STD_LOGIC;
           qn : out STD_LOGIC);
end latch_d_component;

architecture latch_d_rtl of latch_d_component is
begin
    process
    begin
        wait until clk'event and clk = '1';
        
        q <= d;
        
        qn <= not d;
        
    end process;

end latch_d_rtl;
