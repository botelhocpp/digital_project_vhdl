library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador_gray_4bits is
Port (  dir : in std_logic;
        clk : in std_logic;
        rst : in std_logic;
        Q : out std_logic_vector(3 downto 0)   );
end contador_gray_4bits;

architecture Behavioral of contador_gray_4bits is
    signal counter : unsigned(3 downto 0);
begin
    Q(0) <= counter(1) XOR counter(0);
    Q(1) <= counter(2) XOR counter(1);
    Q(2) <= counter(3) XOR counter(2);
    Q(3) <= counter(3);
    
    PROCESS(rst, clk)
    BEGIN
        if(rst = '1') then
            counter <= (OTHERS => '0');
        elsif(rising_edge(clk)) then
            if(dir = '1') then
                counter <= counter + 1;
            else
                counter <= counter - 1;
            end if;
        end if;
    END PROCESS;
end Behavioral;
