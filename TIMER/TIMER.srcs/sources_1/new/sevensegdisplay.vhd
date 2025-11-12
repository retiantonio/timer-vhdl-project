----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2024 11:19:11 AM
-- Design Name: 
-- Module Name: sevensegdisplay - Behavioral
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

entity sevensegdisplay is
     Port (STARE_M: in std_logic_vector(7 downto 0);
           STARE_S: in std_logic_vector(7 downto 0);
           clk: in std_logic;
           out_seg: out std_logic); --nuj ce vine aici
end sevensegdisplay;

architecture Behavioral of sevensegdisplay is

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

signal counteroutput: std_logic_vector(16 downto 0);
signal ZECI_M: std_logic_vector(3 downto 0);
signal ZECI_S: std_logic_vector(3 downto 0);
signal UNITATI_M: std_logic_vector(3 downto 0);
signal UNITATI_S: std_logic_vector(3 downto 0);
signal ANOZI: std_logic_vector(7 downto 0);
begin
counter: counter17 port map(clk, counteroutput);

mux: mux_anod port map(counteroutput(16 downto 14),ANOZI);

convertor_minute: convertor port map(STARE_M, ZECI_M, UNITATI_M);
convertor_secunde: convertor port map(STARE_S, ZECI_S, UNITATI_S);

display_secunde: display port map
display_minute: display port map
end Behavioral;
