library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_contador_decimal_99 is
end testbench_contador_decimal_99;

architecture Behavioral of testbench_contador_decimal_99 is
    signal clk, rst : std_logic := '0';
    
    signal Q_sig : std_logic_vector(7 downto 0) := (OTHERS => '0');
begin
    COMPONENTE_CONTADOR: 
    ENTITY WORK.contador_decimal_99 PORT MAP (
        clk => clk, 
        rst => rst,
        Q => Q_sig
    );
    
    clk <= not clk after 10ns;
    rst <= '1', '0' after 5ns;

end Behavioral;
