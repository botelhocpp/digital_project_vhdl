library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flip_flop_d is
Port (  D : in std_logic;
        clk : in std_logic;
        rst : in std_logic;
        Q : out std_logic   );
end flip_flop_d;

architecture Behavioral of flip_flop_d is
begin
    PROCESS(rst, clk)
    BEGIN
        if(rst = '1') then
            Q <= '0';
        elsif(rising_edge(clk)) then
            Q <= D;
        end if;
    END PROCESS;
end Behavioral;
