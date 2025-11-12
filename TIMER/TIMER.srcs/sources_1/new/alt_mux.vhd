----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2024 10:56:32 AM
-- Design Name: 
-- Module Name: alt_mux - Behavioral
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

entity alt_mux is
    Port (SEL: in std_logic_vector(2 downto 0);
          ZECI_M: in std_logic_vector(3 downto 0);
          UNITATI_M: in std_logic_vector(3 downto 0);
          ZECI_S: in std_logic_vector(3 downto 0);
          UNITATI_S: in std_logic_vector(3 downto 0);
          IESIRE: out std_logic_vector(3 downto 0));
end alt_mux;

architecture Behavioral of alt_mux is

begin
process
begin
    case SEL is
        when "000" => IESIRE <= UNITATI_S;
        when "001" => IESIRE <= ZECI_S;
        when "010" => IESIRE <= UNITATI_M;
        when "011" => IESIRE <= ZECI_M;
        when others => IESIRE <= "0000" ;
    end case;
end process;

end Behavioral;
