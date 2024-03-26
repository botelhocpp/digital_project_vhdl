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
    w     : in std_logic;
    z     : out std_logic
  );
end component; 

signal reset, clk, w : std_logic := '1';
type estados is (A, B, C);
signal y : estados;    
signal z : std_logic;
constant clk_freq : integer := 50e6;
constant clk_period : time := 5000ms / clk_freq;

begin
    DUT_FSM: fsm_moore port map(clk, reset, w, z);
    
    clk <= not clk after clk_period/2;
    
    process 
    begin
        -- w = 0 1 0 1 1 0 1 1 1 0 1
        -- z = 0 0 0 0 0 1 0 0 1 1 0
        
        reset <= '0'; wait for clk_period;
        w <= '0'; wait for clk_period;
        w <= '1'; wait for clk_period;
        w <= '0'; wait for clk_period;
        w <= '1'; wait for clk_period;
        w <= '1'; wait for clk_period;
        w <= '0'; wait for clk_period;
        w <= '1'; wait for clk_period;
        w <= '1'; wait for clk_period;
        w <= '1'; wait for clk_period;
        w <= '0'; wait for clk_period;
        w <= '1'; wait for clk_period;
        
    end process;
end Behavioral;
