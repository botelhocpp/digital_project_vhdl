library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_flip_flop is
end testbench_flip_flop;

architecture Behavioral of testbench_flip_flop is
    signal D_sig, J_sig, K_sig : std_logic := '0';
    
    signal clk, rst : std_logic := '0';
    
    signal Q_FFD, Q_FFJK : std_logic := '0';
begin
    COMPONENTE_FF_D: 
    ENTITY WORK.flip_flop_d PORT MAP (
        D => D_sig, 
        clk => clk, 
        rst => rst,
        Q => Q_FFD
    );
    COMPONENTE_FF_JK: 
    ENTITY WORK.flip_flop_jk PORT MAP (
        J => J_sig, 
        K => K_sig, 
        clk => clk, 
        rst => rst,
        Q => Q_FFJK
    );
    
    clk <= not clk after 10ns;
    rst <= '1', '0' after 5ns;
    
    PROCESS
    BEGIN
        D_sig <= '1';
        J_sig <= '1';
        K_sig <= '0';
        wait for 20ns;
        
        D_sig <= '0';
        J_sig <= '0';
        K_sig <= '0';
        wait for 20ns;
        
        J_sig <= '0';
        K_sig <= '1';
        wait for 20ns;
        
        D_sig <= '1';
        J_sig <= '0';
        K_sig <= '0';
        wait for 20ns;
        
        J_sig <= '1';
        K_sig <= '1';
        wait;
    END PROCESS;


end Behavioral;
