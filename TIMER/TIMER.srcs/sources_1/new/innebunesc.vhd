----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/30/2024 12:04:11 AM
-- Design Name: 
-- Module Name: innebunesc - Behavioral
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

entity innebunesc is
    Port (S: in std_logic;
          S_out: out std_logic);
end innebunesc;

architecture Behavioral of innebunesc is

begin
process(S)
begin
    if rising_edge(S) then
        S_out <= '1';
    else S_out <= '0';
    end if;
end process;

end Behavioral;
