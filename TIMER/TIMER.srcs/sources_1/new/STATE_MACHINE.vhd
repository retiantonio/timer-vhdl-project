----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2024 07:30:04 PM
-- Design Name: 
-- Module Name: STATE_MACHINE - Behavioral
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

entity STATE_MACHINE is
    Port (START: in std_logic;
          M: in std_logic;
          S: in std_logic;
          CLK: in std_logic;
          carry_m: in std_logic;
          carry_s: in std_logic;
          MODE: out std_logic_vector(1 downto 0);
          ENABLE_M: out std_logic;
          ENABLE_S: out std_logic);
end STATE_MACHINE;

architecture Behavioral of STATE_MACHINE is

signal S_APASAT: std_logic := '0';
signal M_APASAT: std_logic := '0';

--definim starile
type STATE_TYPE is (ZERO, COUNT_UP, STOP, MINUTE, SECUNDE, COUNT_DOWN);

--2 semnale ptr starea curenta si starea urmatoare
signal state, next_state: STATE_TYPE := ZERO;
begin

UPDATE_STATE:process(CLK)
        begin
            if rising_edge(CLK) then
                state <= next_state;
            end if;
        end process;
        
TRANZITIONS: process(state, START, M, S, carry_m, carry_s)
        begin
        ENABLE_M <= '0';
        ENABLE_S <= '0';
        MODE <= "01";
            case state is
                --ZERO STATE
                when ZERO =>
                    MODE <= "00";
                    if START  = '1' then
                        next_state <= COUNT_UP;
                    elsif M = '1' then
                        next_state <= MINUTE;
                    elsif S = '1' then
                        next_state <= SECUNDE;
                    else next_state <= ZERO;
                    end if;
                --COUNT UP STATE
                when COUNT_UP =>
                    ENABLE_S <= '1';
                    if START = '1' then
                        next_state <= STOP;
                    elsif M = '1' then
                        next_state <= MINUTE;
                    elsif S = '1' then
                        next_state <= SECUNDE;
                    else next_state <= COUNT_UP;
                    end if;
                --STOP STATE
                when STOP =>
                     if START = '1' then
                        next_state <= COUNT_UP;
                     elsif M = '1' then
                        next_state <= MINUTE;
                     elsif S = '1' then
                        next_state <= SECUNDE;
                     else next_state <= STOP;
                     end if;
                 --MINUTE STATE
                 when MINUTE =>
                      --
                      if M_APASAT = '0' then
                        ENABLE_M <= '1';
                      end if;
                      if M = '1' then
                        --ENABLE_M <= '0';
                        M_APASAT <= not(M_APASAT);
                      end if;
                      --
                      if START = '1' then
                        next_state <= COUNT_DOWN;
                      elsif S = '1' then
                        next_state <= SECUNDE;
                      elsif S = '1' and M = '1' then
                        next_state <= ZERO;
                      else next_state <= MINUTE;
                      end if;
                  --SECUNDE STATE
                  when SECUNDE =>
                      --
                      if S_APASAT = '0' then
                        ENABLE_S <= '1';
                      end if;
                      if S = '1' then
                        --ENABLE_S <= '0';
                        S_APASAT <= not(S_APASAT);
                      end if;
                      --
                      if START = '1' then
                        next_state <= COUNT_DOWN;
                      elsif M = '1' then
                        next_state <= MINUTE;
                      elsif M = '1' and S = '1' then
                        next_state <= ZERO;
                      else next_state <= SECUNDE;
                      end if;
                  --COUNT DOWN STATE
                  when COUNT_DOWN =>
                      MODE <= "10";
                      ENABLE_S <= '1';
                      --
                      if carry_m = '1' and carry_s = '1' then
                        next_state <= ZERO;
                      else next_state <= COUNT_DOWN;
                      end if;
                      --
            end case;          
        end process;
end Behavioral;
