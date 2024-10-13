library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_mux_4 is
end testbench_mux_4;

architecture Behavioral of testbench_mux_4 is
    -- Declarei os sinais que vou usar
    SIGNAL A_sig : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL B_sig : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL C_sig : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL D_sig : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL S_sig : std_logic_vector(1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL Q_sig : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
begin
    COMPONENTE_MUX_4: 
    ENTITY WORK.mux_4 PORT MAP (
        A => A_sig, 
        B => B_sig, 
        C => C_sig, 
        D => D_sig, 
        S => S_sig, 
        Q => Q_sig
    );
    
    PROCESS
    BEGIN
        A_sig <= "00000001";
        B_sig <= "00000010";
        C_sig <= "00000100";
        D_sig <= "00001000";
        S_sig <= "00";
        wait for 20ns;
        
        S_sig <= "01";
        wait for 20ns;
        
        S_sig <= "10";
        wait for 20ns;
        
        S_sig <= "11";
        wait for 20ns;
        
        S_sig <= "ZZ";
        wait;
    END PROCESS;


end Behavioral;
