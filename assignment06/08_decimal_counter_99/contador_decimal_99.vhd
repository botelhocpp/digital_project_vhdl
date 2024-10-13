library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador_decimal_99 is
Port (  clk : in std_logic;
        rst : in std_logic;
        Q : out std_logic_vector(7 downto 0)   );
end contador_decimal_99;

architecture rtl of contador_decimal_99 is
    signal counter_dezenas : unsigned(3 downto 0);
    signal counter_unidades : unsigned(3 downto 0);
begin
    Q <= std_logic_vector(counter_dezenas) & std_logic_vector(counter_unidades);
    
    -- Process
    PROCESS(rst, clk)
    BEGIN
        if(rst = '1') then
            counter_dezenas <= (OTHERS => '0');
            counter_unidades <= (OTHERS => '0');
        elsif(rising_edge(clk)) then
            if(counter_unidades = "1001") then
                counter_unidades <= (OTHERS => '0');
                
                if(counter_dezenas = "1001") then
                    counter_dezenas <= (OTHERS => '0');
                else
                    counter_dezenas <= counter_dezenas + 1;
                end if;
            else                                             
                counter_unidades <= counter_unidades + 1;
            end if;
        end if;
    END PROCESS;
end rtl;
