library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity fsm_moore is
  Port ( 
    clock : in std_logic; 
    rst   : in std_logic;   
    x     : in std_logic;
    y     : out std_logic
  );
end fsm_moore;

architecture rtl of fsm_moore is
    type estados is (A, B, C);
    signal e : estados;    
begin
    process(rst, clock)
    begin
        if(rst = '1') then
            e <= A;
            y <= '0';
        elsif(rising_edge(clock))then
            case e is
                when A =>
                    y <= '0';
                    if(x = '1')then
                        e <= B;
                    else
                        e <= A;
                    end if;
                when B =>
                    y <= '1';
                    e <= C;
                when C =>
                    y <= '1';
                    e <= A;
            end case;
        end if;
    end process;
end rtl;
