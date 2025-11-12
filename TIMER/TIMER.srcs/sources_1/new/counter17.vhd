----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2024 11:04:52 AM
-- Design Name: 
-- Module Name: counter17 - Behavioral
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
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter17 is
  Port (clk: in std_logic;
        Q: out std_logic_vector(16 downto 0));
end counter17;

architecture Behavioral of counter17 is

signal Q_de_stocat: std_logic_vector(16 downto 0) := (others => '0');

begin
process(clk)
begin
    if rising_edge(clk) then
        Q_de_stocat <= Q_de_stocat + 1;
    end if;
    Q <= Q_de_stocat;
end process;


end Behavioral;
