library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_all is
--  Port ( );
end testbench_all;

architecture testbench_rtl of testbench_all is
    -- Components
    component buffer_component is
        port (
            clk: in std_logic;
            a: in std_logic;
            x: out std_logic
        );
    end component;
    component or_component is
        port (
            clk: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
        );
    end component;
    component and_component is
        port (
            clk: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
        );
    end component;
    component xor_component is
        port (
            clk: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
        );
    end component;
    component not_component is
        port (
            clk: in std_logic;
            a: in std_logic;
            x: out std_logic
        );
    end component;
    component nor_component is
        port (
            clk: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
        );
    end component;
    component nand_component is
        port (
            clk: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
        );
    end component;
    component xnor_component is
        port (
            clk: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
        );
    end component;
    component half_adder_component is
        port (
           clk : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           s : out STD_LOGIC;
           c : out STD_LOGIC
        );
    end component;
    component latch_sr_component is
        port (
           clk : in STD_LOGIC;
           s : in STD_LOGIC;
           r : in STD_LOGIC;
           q : out STD_LOGIC;
           qn : out STD_LOGIC
        );
    end component;
    component latch_d_component is
        port (
           clk : in STD_LOGIC;
           d : in STD_LOGIC;
           q : out STD_LOGIC;
           qn : out STD_LOGIC
        );
    end component;
    
    -- Signals
    signal clk: std_logic := '0';
    signal a: std_logic := '0';
    signal b: std_logic := '0';

    signal x_buffer: std_logic;
    signal x_or: std_logic;
    signal x_and: std_logic;
    signal x_xor: std_logic;
    signal x_not: std_logic;
    signal x_nor: std_logic;
    signal x_nand: std_logic;
    signal x_xnor: std_logic;
    signal s_ha: std_logic;
    signal c_ha: std_logic;
    signal q_latch_sr: std_logic;
    signal qn_latch_sr: std_logic;
    signal q_latch_d: std_logic;
    signal qn_latch_d: std_logic;
    
    constant clk_period:time:= 100 ns;
begin
    clk <= not clk after clk_period/2;
    
    buffer_dut:buffer_component port map(clk, a, x_buffer);
    or_dut:or_component port map(clk, a, b, x_or);
    and_dut:and_component port map(clk, a, b, x_and);
    xor_dut:xor_component port map(clk, a, b, x_xor);
    not_dut:not_component port map(clk, a, x_not);
    nor_dut:nor_component port map(clk, a, b, x_nor);
    nand_dut:nand_component port map(clk, a, b, x_nand);
    xnor_dut:xnor_component port map(clk, a, b, x_xnor);
    half_adder_dut:half_adder_component port map(clk, a, b, s_ha, c_ha);
    latch_sr_dut:latch_sr_component port map(clk, a, b, q_latch_sr, qn_latch_sr);
    latch_d_dut:latch_d_component port map(clk, a, q_latch_d, qn_latch_d);
    
    inputs:process
    begin
        -- Input 1
        a <= '0';
        b <= '0';
        wait for clk_period;
        
        -- Input 2
        a <= '0';
        b <= '1';
        wait for clk_period;
        
        -- Input 3
        a <= '1';
        b <= '0';
        wait for clk_period;
        
        -- Input 4
        a <= '1';
        b <= '1';
        wait for clk_period;
        
    end process;

end testbench_rtl;
