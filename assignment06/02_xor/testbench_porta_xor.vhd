library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_porta_xor is
end testbench_porta_xor;

architecture Behavioral of testbench_porta_xor is
    -- Declarei os sinais que vou usar
    signal A_sig : std_logic := '0';
    signal B_sig : std_logic := '0';
    signal C_sig : std_logic := '0';
begin
    COMPONENTE_XOR:
    entity work.porta_xor
    Port map (  A => A_sig,
                B => B_sig,
                C => C_sig  );
    
    PROCESS
    BEGIN
        A_sig <= '0';
        B_sig <= '0';
        wait for 20ns;
        
        A_sig <= '1';
        B_sig <= '0';
        wait for 20ns;
        
        A_sig <= '0';
        B_sig <= '1';
        wait for 20ns;
        
        A_sig <= '1';
        B_sig <= '1';
        wait;
    END PROCESS;


end Behavioral;
