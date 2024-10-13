library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_contador_gray_4bits is
end testbench_contador_gray_4bits;

architecture Behavioral of testbench_contador_gray_4bits is
    signal clk, rst, dir_sig : std_logic := '0';
    
    signal Q_sig : std_logic_vector(3 downto 0) := (OTHERS => '0');
begin
    COMPONENTE_CONTADOR: 
    ENTITY WORK.contador_gray_4bits PORT MAP (
        dir => dir_sig,
        clk => clk, 
        rst => rst,
        Q => Q_sig
    );
    
    clk <= not clk after 10ns;
    rst <= '1', '0' after 5ns;
    dir_sig <= '1', '0' after 16*20ns;

end Behavioral;
