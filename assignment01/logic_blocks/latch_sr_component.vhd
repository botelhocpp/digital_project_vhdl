library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity latch_sr_component is
    Port ( clk : in STD_LOGIC;
           s : in STD_LOGIC;
           r : in STD_LOGIC;
           q : out STD_LOGIC;
           qn : out STD_LOGIC);
end latch_sr_component;

architecture latch_sr_rtl of latch_sr_component is
begin
    process
    begin
        wait until clk'event and clk = '1';
        
        if(s = '1' and r = '0')then
            q <= '1';
            qn <= '0';
        elsif(s = '0' and r = '1') then
            q <= '0';
            qn <= '1';
        end if;
        
    end process;

end latch_sr_rtl;
