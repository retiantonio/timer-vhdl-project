----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2024 10:29:57 AM
-- Design Name: 
-- Module Name: mux8_1 - Behavioral
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

entity convertor is
    Port (x: in std_logic_vector(7 downto 0);
          zeci: out std_logic_vector(3 downto 0);
          unitati: out std_logic_vector(3 downto 0));
end convertor;

architecture Behavioral of convertor is

signal sute: STD_LOGIC_VECTOR (3 downto 0);

begin
    process(x)
    begin
        case x is
            when "00000000" => zeci <= "0000"; unitati <= "0000";
            when "00000001" => zeci <= "0000"; unitati <= "0001";
            when "00000010" => zeci <= "0000"; unitati <= "0010";
            when "00000011" => zeci <= "0000"; unitati <= "0011";
            when "00000100" => zeci <= "0000"; unitati <= "0100";
            when "00000101" => zeci <= "0000"; unitati <= "0101";
            when "00000110" => zeci <= "0000"; unitati <= "0110";
            when "00000111" => zeci <= "0000"; unitati <= "0111";
            when "00001000" => zeci <= "0000"; unitati <= "1000";
            when "00001001" => zeci <= "0000"; unitati <= "1001";
            when "00001010" => zeci <= "0001"; unitati <= "0000";
            when "00001011" => zeci <= "0001"; unitati <= "0001";
            when "00001100" => zeci <= "0001"; unitati <= "0010";
            when "00001101" => zeci <= "0001"; unitati <= "0011";
            when "00001110" => zeci <= "0001"; unitati <= "0100";
            when "00001111" => zeci <= "0001"; unitati <= "0101";
            when "00010000" => sute <= "0000"; zeci <= "0001"; unitati <= "0110";
            when "00010001" => sute <= "0000"; zeci <= "0001"; unitati <= "0111";
            when "00010010" => sute <= "0000"; zeci <= "0001"; unitati <= "1000";
            when "00010011" => sute <= "0000"; zeci <= "0001"; unitati <= "1001";
            when "00010100" => sute <= "0000"; zeci <= "0010"; unitati <= "0000";
            when "00010101" => sute <= "0000"; zeci <= "0010"; unitati <= "0001";
            when "00010110" => sute <= "0000"; zeci <= "0010"; unitati <= "0010";
            when "00010111" => sute <= "0000"; zeci <= "0010"; unitati <= "0011";
            when "00011000" => sute <= "0000"; zeci <= "0010"; unitati <= "0100";
            when "00011001" => sute <= "0000"; zeci <= "0010"; unitati <= "0101";
            when "00011010" => sute <= "0000"; zeci <= "0010"; unitati <= "0110";
            when "00011011" => sute <= "0000"; zeci <= "0010"; unitati <= "0111";
            when "00011100" => sute <= "0000"; zeci <= "0010"; unitati <= "1000";
            when "00011101" => sute <= "0000"; zeci <= "0010"; unitati <= "1001";
            when "00011110" => sute <= "0000"; zeci <= "0011"; unitati <= "0000";
            when "00011111" => sute <= "0000"; zeci <= "0011"; unitati <= "0001";
            when "00100000" => sute <= "0000"; zeci <= "0011"; unitati <= "0010";
            when "00100001" => sute <= "0000"; zeci <= "0011"; unitati <= "0011";
            when "00100010" => sute <= "0000"; zeci <= "0011"; unitati <= "0100";
            when "00100011" => sute <= "0000"; zeci <= "0011"; unitati <= "0101";
            when "00100100" => sute <= "0000"; zeci <= "0011"; unitati <= "0110";
            when "00100101" => sute <= "0000"; zeci <= "0011"; unitati <= "0111";
            when "00100110" => sute <= "0000"; zeci <= "0011"; unitati <= "1000";
            when "00100111" => sute <= "0000"; zeci <= "0011"; unitati <= "1001";
            when "00101000" => sute <= "0000"; zeci <= "0100"; unitati <= "0000";
            when "00101001" => sute <= "0000"; zeci <= "0100"; unitati <= "0001";
            when "00101010" => sute <= "0000"; zeci <= "0100"; unitati <= "0010";
            when "00101011" => sute <= "0000"; zeci <= "0100"; unitati <= "0011";
            when "00101100" => sute <= "0000"; zeci <= "0100"; unitati <= "0100";
            when "00101101" => sute <= "0000"; zeci <= "0100"; unitati <= "0101";
            when "00101110" => sute <= "0000"; zeci <= "0100"; unitati <= "0110";
            when "00101111" => sute <= "0000"; zeci <= "0100"; unitati <= "0111";
            when "00110000" => sute <= "0000"; zeci <= "0100"; unitati <= "1000";
            when "00110001" => sute <= "0000"; zeci <= "0100"; unitati <= "1001";
            when "00110010" => sute <= "0000"; zeci <= "0101"; unitati <= "0000";
            when "00110011" => sute <= "0000"; zeci <= "0101"; unitati <= "0001";
            when "00110100" => sute <= "0000"; zeci <= "0101"; unitati <= "0010";
            when "00110101" => sute <= "0000"; zeci <= "0101"; unitati <= "0011";
            when "00110110" => sute <= "0000"; zeci <= "0101"; unitati <= "0100";
            when "00110111" => sute <= "0000"; zeci <= "0101"; unitati <= "0101";
            when "00111000" => sute <= "0000"; zeci <= "0101"; unitati <= "0110";
            when "00111001" => sute <= "0000"; zeci <= "0101"; unitati <= "0111";
            when "00111010" => sute <= "0000"; zeci <= "0101"; unitati <= "1000";
            when "00111011" => sute <= "0000"; zeci <= "0101"; unitati <= "1001";
            when "00111100" => sute <= "0000"; zeci <= "0110"; unitati <= "0000";
            when "00111101" => sute <= "0000"; zeci <= "0110"; unitati <= "0001";
            when "00111110" => sute <= "0000"; zeci <= "0110"; unitati <= "0010";
            when "00111111" => sute <= "0000"; zeci <= "0110"; unitati <= "0011";
            when "01000000" => sute <= "0000"; zeci <= "0110"; unitati <= "0100";
            when "01000001" => sute <= "0000"; zeci <= "0110"; unitati <= "0101";
            when "01000010" => sute <= "0000"; zeci <= "0110"; unitati <= "0110";
            when "01000011" => sute <= "0000"; zeci <= "0110"; unitati <= "0111";
            when "01000100" => sute <= "0000"; zeci <= "0110"; unitati <= "1000";
            when "01000101" => sute <= "0000"; zeci <= "0110"; unitati <= "1001";
            when "01000110" => sute <= "0000"; zeci <= "0111"; unitati <= "0000";
            when "01000111" => sute <= "0000"; zeci <= "0111"; unitati <= "0001";
            when "01001000" => sute <= "0000"; zeci <= "0111"; unitati <= "0010";
            when "01001001" => sute <= "0000"; zeci <= "0111"; unitati <= "0011";
            when "01001010" => sute <= "0000"; zeci <= "0111"; unitati <= "0100";
            when "01001011" => sute <= "0000"; zeci <= "0111"; unitati <= "0101";
            when "01001100" => sute <= "0000"; zeci <= "0111"; unitati <= "0110";
            when "01001101" => sute <= "0000"; zeci <= "0111"; unitati <= "0111";
            when "01001110" => sute <= "0000"; zeci <= "0111"; unitati <= "1000";
            when "01001111" => sute <= "0000"; zeci <= "0111"; unitati <= "1001";
            when "01010000" => sute <= "0000"; zeci <= "1000"; unitati <= "0000";
            when "01010001" => sute <= "0000"; zeci <= "1000"; unitati <= "0001";
            when "01010010" => sute <= "0000"; zeci <= "1000"; unitati <= "0010";
            when "01010011" => sute <= "0000"; zeci <= "1000"; unitati <= "0011";
            when "01010100" => sute <= "0000"; zeci <= "1000"; unitati <= "0100";
            when "01010101" => sute <= "0000"; zeci <= "1000"; unitati <= "0101";
            when "01010110" => sute <= "0000"; zeci <= "1000"; unitati <= "0110";
            when "01010111" => sute <= "0000"; zeci <= "1000"; unitati <= "0111";
            when "01011000" => sute <= "0000"; zeci <= "1000"; unitati <= "1000";
            when "01011001" => sute <= "0000"; zeci <= "1000"; unitati <= "1001";
            when "01011010" => sute <= "0000"; zeci <= "1001"; unitati <= "0000";
            when "01011011" => sute <= "0000"; zeci <= "1001"; unitati <= "0001";
            when "01011100" => sute <= "0000"; zeci <= "1001"; unitati <= "0010";
            when "01011101" => sute <= "0000"; zeci <= "1001"; unitati <= "0011";
            when "01011110" => sute <= "0000"; zeci <= "1001"; unitati <= "0100";
            when "01011111" => sute <= "0000"; zeci <= "1001"; unitati <= "0101";
            when "01100000" => sute <= "0000"; zeci <= "1001"; unitati <= "0110";
            when "01100001" => sute <= "0000"; zeci <= "1001"; unitati <= "0111";
            when "01100010" => sute <= "0000"; zeci <= "1001"; unitati <= "1000";
            when "01100011" => sute <= "0000"; zeci <= "1001"; unitati <= "1001";
            when "01100100" => sute <= "0001"; zeci <= "0000"; unitati <= "0000";
            when others => sute <= "0000"; zeci <= "0000"; unitati <= "0000";
        end case;
    end process;

end Behavioral;

