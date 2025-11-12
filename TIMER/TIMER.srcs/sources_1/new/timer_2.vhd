----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2024 07:12:51 PM
-- Design Name: 
-- Module Name: timer_2 - Behavioral
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

entity timer_2 is
   Port (M: in std_logic; --buton ptr secunde
          S: in std_logic; --buton ptr minute
          CLK: in std_logic; --clockul
          START: in std_logic; --butonul de START/STOP
          Q: out std_logic_vector(3 downto 0));
end timer_2;

architecture Behavioral of timer_2 is
 component counter_reversibil is
        Port(D: in std_logic_vector(3 downto 0);
             MODE: in std_logic_vector(1 downto 0);
             CLK: in std_logic;
             Q: out std_logic_vector(3 downto 0));
     end component;
     
     signal STARE_NUMARATOR_MINUTE: std_logic_vector(7 downto 0);
     signal STARE_NUMARATOR_SECUNDE: std_logic_vector(7 downto 0);
     signal MODE: std_logic_vector(1 downto 0);
     
     signal start_pressed: std_logic;
     signal running: std_logic;
     
begin
--incepem din starea ZERO
STARE_NUMARATOR_MINUTE <= (others => '0');
STARE_NUMARATOR_SECUNDE <= (others => '0');

process(CLK, START)
begin
   if START = '1' then
   start_pressed <= '1';
   end if;
    
end process;

SECUNDE: counter_reversibil port map (STARE_NUMARATOR_SECUNDE, MODE, CLK, STARE_NUMARATOR_SECUNDE);

process(M, S)
begin
if M = '1' then
--cod ptr min
elsif S = '1' then
--cod ptr sec
end if;
end process;
 













end Behavioral;
