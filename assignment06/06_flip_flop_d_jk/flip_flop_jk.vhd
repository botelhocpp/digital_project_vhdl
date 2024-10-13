library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flip_flop_jk is
Port (  J : in std_logic;
        K : in std_logic;
        clk : in std_logic;
        rst : in std_logic;
        Q : out std_logic   );
end flip_flop_jk;

architecture Behavioral of flip_flop_jk is
    signal Q_sig : std_logic;
begin
    Q <= Q_sig;
    
    PROCESS(rst, clk)
    BEGIN
        if(rst = '1') then
            Q_sig <= '0';
        elsif(rising_edge(clk)) then
            if(J = '1' and K = '0') then
                Q_sig <= '1';
            elsif(J = '0' and K = '1') then
                Q_sig <= '0';
            elsif(J = '1' and K = '1') then
                Q_sig <= not Q_sig;
            end if;
        end if;
    END PROCESS;
end Behavioral;
