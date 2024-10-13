library ieee;
use ieee.std_logic_1164.all;

entity ps2_display_tb is
end ps2_display_tb;

architecture behavioral of ps2_display_tb is

    type DataT is array (0 to 3) of std_logic_vector (7 downto 0);
    constant DATA : DataT := ( "00101010", "00110011", "00100011", "01001011" );
    constant CLK_50MHZ_period : time := 20 ns;

    signal CLK_50MHZ : std_logic := '0';
    signal PS2_CLK, PS2_DATA : std_logic := '1';
    signal J1, J2 : std_logic_vector(3 downto 0);

    procedure ps2_bit(B : in std_logic;
                      signal CLK, DATA : out std_logic) is
    begin
        DATA <= B;
        wait for 15 us;
        CLK <= '0';
        wait for 30 us;
        CLK <= '1';
        wait for 15 us;
    end procedure;

begin

    -- Instanciação da Unidade Sob Teste (UUT)
    uut : entity work.ps2_display
        port map ( CLK_50MHZ, PS2_CLK, PS2_DATA, J1, J2 );

    -- Geração do Clock de 50 MHz
    process is
    begin
        CLK_50MHZ <= '0';
        wait for CLK_50MHZ_period / 2;
        CLK_50MHZ <= '1';
        wait for CLK_50MHZ_period / 2;
    end process;

    -- Processo de envio de dados PS/2
    process is
    begin
        for i in DATA'range loop
            ps2_bit('0', PS2_CLK, PS2_DATA); -- start bit
            for j in 0 to 7 loop
                ps2_bit(DATA(i)(j), PS2_CLK, PS2_DATA); -- data bits
            end loop;
            ps2_bit('0', PS2_CLK, PS2_DATA); -- bit de paridade (descartado)
            ps2_bit('1', PS2_CLK, PS2_DATA); -- stop bit
            wait for 10 ms; -- Espera 10ms antes de enviar o próximo byte
        end loop;
    end process;

end architecture;
