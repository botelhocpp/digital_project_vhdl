library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_blocks is
    port (
        clk : in std_logic;
        sw0: in std_logic;
        sw1: in std_logic;
        sw2: in std_logic;
        sw3: in std_logic;
        led0 : out std_logic;
        led1 : out std_logic;
        led2 : out std_logic;
        led3 : out std_logic
    );
end testbench;

architecture testbench_rtl of testbench_blocks is
    component latch_sr_component is
        port (
            clk: in std_logic;
            s: in std_logic;
            r: in std_logic;
            q: out std_logic;
            qn: out std_logic
        );
    end component;
    
    component half_adder_component is
        port (
            clk: in std_logic;
            a: in std_logic;
            b: in std_logic;
            s: out std_logic;
            c: out std_logic
        );
    end component;
    
begin
    latch_sr_dut: latch_sr_component port map(clk, sw0, sw1, led0, led1);
    half_adder_dut: half_adder_component port map(clk, sw2, sw3, led2, led3);

end testbench_rtl;
