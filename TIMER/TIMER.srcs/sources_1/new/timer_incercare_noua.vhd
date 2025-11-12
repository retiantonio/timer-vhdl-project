----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2024 01:39:27 PM
-- Design Name: 
-- Module Name: timer_incercare_noua - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timer_incercare_noua is
    Port (START: in std_logic;
          M: in std_logic;
          S: in std_logic;
          CLK: in std_logic;
          catozi: out std_logic_vector(6 downto 0);
          anozi: out std_logic_vector(7 downto 0));
end timer_incercare_noua;

architecture Behavioral of timer_incercare_noua is
    
    component STATE_MACHINE is
        Port (START: in std_logic;
              M: in std_logic;
              S: in std_logic;
              CLK: in std_logic;
              carry_m: in std_logic;
              carry_s: in std_logic;
              MODE: out std_logic_vector(1 downto 0);
              ENABLE_M: out std_logic;
              ENABLE_S: out std_logic);
    end component;
    
    component divizor is
        Port (clk1: in std_logic;
              clk: out std_logic);
    end component;
    
    component counter_reversibil is
        Port(MODE: in std_logic_vector(1 downto 0);
             CLK: in std_logic;
             ENABLE_COUNTER: in std_logic;
             CARRY: out std_logic;
             Q: out std_logic_vector(7 downto 0));
    end component;
    
    component counter_reversibil2 is
        Port(MODE: in std_logic_vector(1 downto 0);
             CLK: in std_logic;
             ENABLE_COUNTER: in std_logic;
             M_MODE: in std_logic;
             CARRY: out std_logic;
             Q: out std_logic_vector(7 downto 0));
    end component;
    
    component MPG is
        Port ( btn : in STD_LOGIC;
               clk : in STD_LOGIC;
               en : out STD_LOGIC);
    end component;
    
    --Debounced buttons
    signal START_DEB: std_logic;
    signal M_DEB: std_logic;
    signal S_DEB: std_logic;
    
    --NEW CLOCK
    signal CLK_NEW: std_logic;
    
    --STATES for counters
    signal STATE_MINUTES_COUNTER: std_logic_vector(7 downto 0) := (others => '0');
    signal STATE_SECONDS_COUNTER: std_logic_vector(7 downto 0) := (others => '0');
    signal COUNTING: std_logic := '0';
    
    --ENABLE signals for counters
    signal ENABLE_COUNTER_MINUTES: std_logic := '0';
    signal ENABLE_COUNTER_SECONDS: std_logic := '0';
    
    --MODE for counters
    signal MODE: std_logic_vector(1 downto 0);
    
    component convertor is
     Port (x: in std_logic_vector(7 downto 0);
          zeci: out std_logic_vector(3 downto 0);
          unitati: out std_logic_vector(3 downto 0));
    end component;

    component counter17 is
      Port (clk: in std_logic;
            Q: out std_logic_vector(16 downto 0));
    end component;
    
    component mux_anod is
        Port (SEL: in std_logic_vector(2 downto 0);
              Y: out std_logic_vector(7 downto 0));
    end component;
    
    component alt_mux is
        Port (SEL: in std_logic_vector(2 downto 0);
              ZECI_M: in std_logic_vector(3 downto 0);
              UNITATI_M: in std_logic_vector(3 downto 0);
              ZECI_S: in std_logic_vector(3 downto 0);
              UNITATI_S: in std_logic_vector(3 downto 0);
              IESIRE: out std_logic_vector(3 downto 0));
    end component;
    
    component display is
     Port (digit: in std_logic_vector(3 downto 0);
           ANOD: out std_logic_vector(6 downto 0));
    end component;

    signal counteroutput: std_logic_vector(16 downto 0);
    signal ZECI_M: std_logic_vector(3 downto 0);
    signal ZECI_S: std_logic_vector(3 downto 0);
    signal UNITATI_M: std_logic_vector(3 downto 0);
    signal UNITATI_S: std_logic_vector(3 downto 0);
    signal IESIRE: std_logic_vector(3 downto 0);
    
    signal M_MODE: std_logic;
    
    signal carry_s, carry_m: std_logic;
    signal borrow_s, borrow_m: std_logic;
begin
STARTDEB: MPG port map(START, CLK, START_DEB);
MDEB: MPG port map(M, CLK, M_DEB);
SDEB: MPG port map(S, CLK, S_DEB);

FREQ_DIV: divizor port map(CLK, CLK_NEW);

STATES: STATE_MACHINE port map(START_DEB, M_DEB, S_DEB, CLK, carry_m, carry_s, MODE, ENABLE_COUNTER_MINUTES, ENABLE_COUNTER_SECONDS);

MINUTES_COUNTER: counter_reversibil2 port map(MODE, CLK_NEW, carry_s, ENABLE_COUNTER_MINUTES, carry_m, STATE_MINUTES_COUNTER);
SECONDS_COUNTER: counter_reversibil port map(MODE, CLK_NEW, ENABLE_COUNTER_SECONDS, carry_s, STATE_SECONDS_COUNTER);

--afisare
counter: counter17 port map(CLK, counteroutput);

mux: mux_anod port map(counteroutput(16 downto 14), anozi);

convertor_minute: convertor port map(STATE_MINUTES_COUNTER, ZECI_M, UNITATI_M);
convertor_secunde: convertor port map(STATE_SECONDS_COUNTER, ZECI_S, UNITATI_S);

mux_catozi: alt_mux port map(counteroutput(16 downto 14), ZECI_M, UNITATI_M, ZECI_S, UNITATI_S, IESIRE);

display_catozi: display port map(IESIRE, catozi);
end Behavioral;