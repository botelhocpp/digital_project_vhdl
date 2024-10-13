library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador_mod_16 is
Port (  clk : in std_logic;
        rst : in std_logic;
        Q : out std_logic_vector(3 downto 0)   );
end contador_mod_16;

architecture Behavioral of contador_mod_16 is
    signal counter : unsigned(3 downto 0);
begin
    Q <= std_logic_vector(counter);
    
    PROCESS(rst, clk)
    BEGIN
        if(rst = '1') then
            counter <= (OTHERS => '0');
        elsif(rising_edge(clk)) then
            counter <= counter + 1;
        end if;
    END PROCESS;
end Behavioral;
