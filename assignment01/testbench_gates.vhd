library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_gates is
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

architecture testbench_rtl of testbench_gates is
    component and_component is
        port (
            clk: in std_logic;
            a: in std_logic;
            b: in std_logic;
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
    
    component not_component is
        port (
            clk: in std_logic;
            a: in std_logic;
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
    
begin
    not_dut: not_component port map(clk, sw3, led3);
    or_dut: or_component port map(clk, sw2, sw3, led2);
    and_dut: and_component port map(clk, sw0, sw1, led1);
    xor_dut: xor_component port map(clk, sw0, sw1, led0);

end testbench_rtl;
