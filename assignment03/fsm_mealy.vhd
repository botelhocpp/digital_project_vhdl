library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity fsm_mealy is
  Port ( 
    clock : in std_logic; 
    rst   : in std_logic;   
    w     : in std_logic;
    z     : out std_logic
  );
end fsm_mealy;

architecture rtl of fsm_mealy is
    type estados is (A, B);
    signal y : estados;    
begin
    process(w, rst,clock)
    begin
        if(rst = '1') then
            y<=A;
        elsif(clock'event and clock = '1')then
            case y is
                when A =>
                    if(w = '0')then
                        y <= A;
                    else
                        y <= B;
                    end if;
                when B =>
                    if(w = '0')then
                        y <= A;
                    else
                        y <= B;
                    end if;
            end case;
        end if;
    end process;
    z <= '1' when y = B and w = '1' else '0';
end rtl;
