library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity testbench_decodificador_3_8 is
end testbench_decodificador_3_8;

architecture Behavioral of testbench_decodificador_3_8 is
    -- Declarei os sinais que vou usar
    signal I_sig : std_logic_vector(2 downto 0) := (OTHERS => '0');
    signal S_sig : std_logic_vector(7 downto 0) := (OTHERS => '0');
begin
    COMPONENTE_DECOD: 
    ENTITY WORK.decodificador_3_8 PORT MAP (
        I => I_sig,
        S => S_sig
    );
    
    PROCESS
    BEGIN
        for i in 0 to 7 loop 
            I_sig <= std_logic_vector(TO_UNSIGNED(i, 3));
            wait for 20ns;
        end loop; 
        
        wait;
    END PROCESS;


end Behavioral;
