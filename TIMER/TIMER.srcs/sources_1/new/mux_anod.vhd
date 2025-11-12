----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2024 10:42:58 AM
-- Design Name: 
-- Module Name: mux_anod - Behavioral
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

entity mux_anod is
    Port (SEL: in std_logic_vector(2 downto 0);
          Y: out std_logic_vector(7 downto 0));
end mux_anod;

architecture Behavioral of mux_anod is

begin
process
begin
    case SEL is
        when "000" => Y <= "11111110";
        when "001" => Y <= "11111101";
        when "010" => Y <= "11111011";
        when "011" => Y <= "11110111";
        when others => Y <= "11111111";
    end case;
end process;

end Behavioral;
