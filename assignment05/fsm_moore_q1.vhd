library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity fsm_moore is
  Port ( 
    clock : in std_logic; 
    rst   : in std_logic;   
    w     : in std_logic;
    z     : out std_logic
  );
end fsm_moore;

architecture rtl of fsm_moore is
    signal Y2, Y1 : std_logic := '0';  
begin
    process(rst, clock)
    begin
        if(rst = '1') then
            Y2 <= '0';
            Y1 <= '0';
        elsif(rising_edge(clock))then
            Y2 <= w AND (Y1 OR Y2);
            Y1 <= w AND (NOT Y1 AND NOT Y2);
        end if;
    end process;
    z <= Y2;
end rtl;
