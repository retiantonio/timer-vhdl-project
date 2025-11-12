----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2024 10:23:11 AM
-- Design Name: 
-- Module Name: 7seg_display - Behavioral
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

entity sevenseg_display is
      Port (STARE_M: in std_logic_vector(7 downto 0);
            STARE_S: in std_logic_vector(7 downto 0);
            out_seg: out std_logic); --nuj ce vine aici
end sevenseg_display;

architecture Behavioral of sevenseg_display is

component mux8_1 is
     Port (x: in std_logic_vector(7 downto 0);
          sel: in std_logic_vector(2 downto 0);
          zeci: out std_logic_vector(3 downto 0);
          unitati: out std_logic_vector(3 downto 0));
end component;

begin
convertor: mux8_1 port map(STARE_M, 


end Behavioral;
