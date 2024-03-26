library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is
 
component fsm_moore is
  Port ( 
    clock : in std_logic;  
    rst   : in std_logic;  
    x     : in std_logic;
    y     : out std_logic
  );
end component; 

signal reset : std_logic := '1';
signal clk : std_logic := '0';
signal x : std_logic := '0';
signal y : std_logic;
constant clk_freq : integer := 50e6;
constant clk_period : time := 5000ms / clk_freq;

begin
    DUT_FSM: fsm_moore port map(clk, reset, x, y);
    
    clk <= not clk after clk_period/2;
    
    process 
    begin     
        x <= '0';
        reset <= '1'; 
        wait for clk_period;
        
        reset <= '0';
        wait for clk_period;
        
        x <= '0'; wait for clk_period;
        x <= '0'; wait for clk_period;
        x <= '1'; wait for clk_period;
        x <= '1'; wait for clk_period;
        x <= '0'; wait for clk_period;
        x <= '1'; wait for clk_period;
        x <= '0'; wait for clk_period;
        x <= '0'; wait for clk_period;
        x <= '0'; wait for clk_period;
        
    end process;
end Behavioral;
