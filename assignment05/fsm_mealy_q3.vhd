library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity fsm_mealy is
  Port ( 
    clock : in std_logic; 
    rst   : in std_logic;   
    w     : in std_logic;
    R1_in : out std_logic;
    R2_in : out std_logic;
    R3_in : out std_logic;
    R1_out : out std_logic;
    R2_out : out std_logic;
    R3_out : out std_logic;
    done : out std_logic
  );
end fsm_mealy;

architecture rtl of fsm_mealy is
    type estados is (A, B, C);
    signal y : estados;    
begin
    process(w, rst, clock)
    begin
        if(rst = '1') then
            y <= A;
        elsif(clock'event and clock = '1')then
            case y is
                when A =>
                    if(w = '1')then
                        y <= B;
                    else
                        y <= A;
                    end if;
                when B =>
                    y <= C;
                when C =>
                    y <= A;
            end case;
        end if;
    end process;
    R1_in <= '1' when y = C else '0';
    R2_in <= '1' when y = B else '0';
    R3_in <= '1' when y = A and w = '1' else '0';
    R1_out <= '1' when y = B else '0';
    R2_out <= '1' when y = A and w = '1' else '0';
    R3_out <= '1' when y = C else '0';
    done <= '1' when y = C else '0';
end rtl;
