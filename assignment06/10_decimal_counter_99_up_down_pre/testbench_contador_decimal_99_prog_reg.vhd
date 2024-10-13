library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_contador_decimal_99_prog_reg is
end testbench_contador_decimal_99_prog_reg;

architecture Behavioral of testbench_contador_decimal_99_prog_reg is
    signal pre_sig, dir_sig, clk, rst : std_logic := '0';
    
    signal D_sig, Q_sig : std_logic_vector(7 downto 0) := (OTHERS => '0');
begin
    COMPONENTE_CONTADOR: 
    ENTITY WORK.contador_decimal_99_prog_reg PORT MAP (
        D => D_sig,
        pre => pre_sig,
        dir => dir_sig,
        clk => clk, 
        rst => rst,
        Q => Q_sig
    );
    
    clk <= not clk after 10ns;
    rst <= '1', '0' after 5ns;
    
    PROCESS
    BEGIN
        D_sig <= x"02";
        pre_sig <= '1';
        dir_sig <= '0';
        wait for 20ns;
        
        pre_sig <= '0';
        wait for 20*20ns;
        
        D_sig <= x"89";
        pre_sig <= '1';
        dir_sig <= '1';
        wait for 20ns;
        
        pre_sig <= '0';
        wait;
    END PROCESS;

end Behavioral;
