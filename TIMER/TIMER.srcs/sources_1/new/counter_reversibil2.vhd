----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 06:22:24 PM
-- Design Name: 
-- Module Name: counter_reversibil - Behavioral
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

entity counter_reversibil2 is
    Port(MODE: in std_logic_vector(1 downto 0);
         CLK: in std_logic;
         ENABLE_COUNTER: in std_logic;
         M_MODE: in std_logic;
         CARRY: out std_logic;
         Q: out std_logic_vector(7 downto 0));
end counter_reversibil2;

architecture Behavioral of counter_reversibil2 is
    
    signal Q_de_stocat: std_logic_vector(7 downto 0);


begin
    process(CLK, MODE)
        begin
        if rising_edge(CLK) then
            if ENABLE_COUNTER = '1' or M_MODE = '1' then
                case MODE is
                    when "00" => 
                        Q_de_stocat <= (others => '0');
                    when "01" =>
                        if Q_de_stocat = "01100011" then
                            Q_de_stocat <= "00000000";
                            CARRY <= '0';
                        elsif Q_de_stocat = "01100010" then
                            Q_de_stocat <= "01100011"; 
                            CARRY <= '1';
                        else Q_de_stocat <= Q_de_stocat + 1;
                        end if;
                    when "10" =>
                        if Q_de_stocat = "00000001" then
                            Q_de_stocat <= (others => '0');
                            CARRY <= '1';
                        elsif Q_de_stocat = "00000000" then
                            CARRY <= '0';
                        else Q_de_stocat <= Q_de_stocat - 1;
                        end if;
                    when "11" =>
                        Q_de_stocat <= (others => '0');  --era pl
                end case;
            end if;
        end if;
    end process;

    Q <= Q_de_stocat;

end Behavioral;