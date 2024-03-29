library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is
 
component fsm_mealy is
  Port ( 
    clock : in std_logic; 
    rst   : in std_logic;   
    w     : in std_logic;
    R1_in : out std_logic;
    R2_in : out std_logic;
    R3_in : out std_logic;
    R1_out : out std_logic;
    R2_out : out std_logic;
    R3_out : out std_logic;
    done : out std_logic
  );
end component; 

signal reset : std_logic := '1';
signal clk : std_logic := '0';
signal w : std_logic := '0';
signal R1_in : std_logic;
signal R2_in : std_logic;
signal R3_in : std_logic;
signal R1_out : std_logic;
signal R2_out : std_logic;
signal R3_out : std_logic;
signal done : std_logic;
constant clk_freq : integer := 50e6;
constant clk_period : time := 5000ms / clk_freq;

begin
    DUT_FSM: fsm_mealy port map(clk, reset, w, R1_in, R2_in, R3_in, R1_out, R2_out, R3_out, done);
    
    clk <= not clk after clk_period/2;
    
    process 
    begin     
        wait for clk_period/2;
        
        w <= '0';
        reset <= '1'; 
        wait for clk_period;
        
        reset <= '0';
        wait for clk_period;
        
        w <= '0'; wait for clk_period;
        w <= '0'; wait for clk_period;
        w <= '1'; wait for clk_period;
        w <= '1'; wait for clk_period;
        w <= '0'; wait for clk_period;
        w <= '1'; wait for clk_period;
        w <= '0'; wait for clk_period;
        w <= '0'; wait for clk_period;
        w <= '0'; wait for clk_period;
        w <= '1'; wait for clk_period;
        w <= '1'; wait for clk_period;
        w <= '1'; wait for clk_period;
        w <= '1'; wait for clk_period;
        w <= '0'; wait for clk_period;
        w <= '0'; wait for clk_period;
        w <= '0'; wait for clk_period;
        
        wait for clk_period/2;
        
    end process;
end Behavioral;
