----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2024 11:32:26 AM
-- Design Name: 
-- Module Name: display - Behavioral
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

entity display is
     Port (digit: in std_logic_vector(3 downto 0);
           ANOD: out std_logic_vector(6 downto 0));
end display;

architecture Behavioral of display is

begin
process(digit)
begin
    case digit is
        when "0000" => ANOD <= "1000000";
        when "0001" => ANOD <= "1111001";
        when "0010" => ANOD <= "0100100";
        when "0011" => ANOD <= "0110000";
        when "0100" => ANOD <= "0011001";
        when "0101" => ANOD <= "0010010";
        when "0110" => ANOD <= "0000010";
        when "0111" => ANOD <= "1111000";
        when "1000" => ANOD <= "0000000";
        when "1001" => ANOD <= "0011000";
        when others => ANOD <= "1111111";
     end case;
end process;   

end Behavioral;
