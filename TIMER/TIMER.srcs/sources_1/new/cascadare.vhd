----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2024 06:58:25 PM
-- Design Name: 
-- Module Name: cascadare - Behavioral
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

entity cascadare is
      Port (STARE_M: in std_logic_vector(7 downto 0);
            STARE_S: in std_logic_vector(7 downto 0);
            ENABLE_M: out std_logic;
            ENABLE_S: out std_logic);
end cascadare;

architecture Behavioral of cascadare is

begin

process(STARE_M, STARE_S)
begin
    if STARE_S = "00111011" then
         ENABLE_M <= '1';
         ENABLE_S <= '0';
    end if;
end process;

end Behavioral;
