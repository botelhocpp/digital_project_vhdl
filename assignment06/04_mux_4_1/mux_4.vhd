library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4 is 
Port (  A : in std_logic_vector(7 DOWNTO 0);
        B : in std_logic_vector(7 DOWNTO 0);
        C : in std_logic_vector(7 DOWNTO 0);
        D : in std_logic_vector(7 DOWNTO 0);
        S : in std_logic_vector(1 DOWNTO 0);
        Q : out std_logic_vector(7 DOWNTO 0)   );
end mux_4;

architecture rtl of mux_4 is
begin
    WITH S SELECT
        Q <=    A WHEN "00",
                B WHEN "01",
                C WHEN "10",
                D WHEN "11",
                (OTHERS => '0') WHEN OTHERS;
    
    --Q <=    A WHEN (S = "00") ELSE
    --        B WHEN (S = "01") ELSE
    --        C WHEN (S = "10") ELSE
    --        D WHEN (S = "11") ELSE
    --        (OTHERS => '0');
end rtl;
