LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ps2_display IS
    PORT (
        CLK_50MHZ : IN STD_LOGIC;       
        PS2_CLK   : IN STD_LOGIC;                      
        PS2_DATA  : IN STD_LOGIC;                       
        J1, J2    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)   
    );
END ps2_display;

ARCHITECTURE structural OF ps2_display IS
    -- Component Declarations
    COMPONENT sync IS
        PORT (
            clk : IN STD_LOGIC;
            a   : IN STD_LOGIC;
            b   : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT keyboard IS
        PORT (
            clk      : IN STD_LOGIC;
            ps2_clk  : IN STD_LOGIC;
            data     : IN STD_LOGIC;
            word     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            V0       : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT driver IS
        PORT (
            cnt       : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            CLK_50MHZ : IN STD_LOGIC;
            J1        : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            J2        : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    -- Signal Declarations
    SIGNAL PS2_CLK_SYNC : STD_LOGIC;             
    SIGNAL PS2_WORD     : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL CNT          : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL V0           : STD_LOGIC;                 

BEGIN
   
    SYNC1 : sync 
        PORT MAP (
            clk => CLK_50MHZ, 
            a   => PS2_CLK, 
            b   => PS2_CLK_SYNC
        );

    TECLADO1 : keyboard 
        PORT MAP (
            clk     => CLK_50MHZ, 
            ps2_clk => PS2_CLK_SYNC, 
            data    => PS2_DATA, 
            word    => PS2_WORD, 
            V0      => V0
        );

    DRIVER1 : driver 
        PORT MAP (
            cnt       => CNT, 
            CLK_50MHZ => CLK_50MHZ, 
            J1        => J1, 
            J2        => J2
        );

    PROCESS(CLK_50MHZ) IS
    BEGIN
        IF rising_edge(CLK_50MHZ) THEN
            IF V0 = '1' THEN
                CNT <= PS2_WORD; 
            END IF;
        END IF;
    END PROCESS;
END structural;
