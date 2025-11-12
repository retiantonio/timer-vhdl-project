----------------------------------------------------------------------------------
-- Company: UTCN & FRIENDS
-- Engineer: RETI ANTONIO
-- 
-- Create Date: 04/09/2024 06:22:23 PM
-- Design Name: INSANE 20 POINTS TIMER
-- Module Name: TIMER - Behavioral
-- Project Name: TIMER
-- Target Devices: PLACUTA DE LAB
-- Tool Versions: 2023.2
-- Description: FACE CHESTII DE TIMER
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

use IEEE.STD_LOGIC_UNSIGNED.all; --librarie folosita pentru counter
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TIMER is
    Port (M_bef: in std_logic; --buton ptr secunde
          S_bef: in std_logic; --buton ptr minute
          CLK: in std_logic; --clockul
          START_bef: in std_logic; --butonul de START/STOP
          Q_M: out std_logic_vector(7 downto 0);
          Q_S: out std_logic_vector(7 downto 0));
end TIMER;

architecture Behavioral of TIMER is
    component counter_reversibil is
        Port(D: in std_logic_vector(3 downto 0);
             MODE: in std_logic_vector(1 downto 0);
             CLK: in std_logic;
             COUNTER_ENABLE: in std_logic;
             Q: out std_logic_vector(3 downto 0));
    end component;
     
    component MPG is
        Port ( btn : in STD_LOGIC;
               clk : in STD_LOGIC;
               en : out STD_LOGIC);
    end component;
     
     component ClockDivider is
        Port(clk_in: in std_logic;
             clk_out: out std_logic);
     end component;
     
     --primary states
     signal STARE_NUMARATOR_MINUTE: std_logic_vector(7 downto 0);
     signal STARE_NUMARATOR_SECUNDE: std_logic_vector(7 downto 0);
     signal MODE: std_logic_vector(1 downto 0);
     
     --helping signals for functionality
     signal ENABLE_COUNTER_MINUTE: std_logic;
     signal ENABLE_COUNTER_SECUNDE: std_logic;
     signal COUNTING_STATUS: std_logic;
     signal END_PROCESS: std_logic;
     signal TIMER_ON: std_logic;
     signal DECREASE_MODE: std_logic;
     signal CLK_SEC: std_logic;
     signal MODE_MINUTE: std_logic;
     signal MODE_SECUNDE: std_logic;
     
     --debounced signals
     signal M: std_logic;
     signal S: std_logic;
     signal START: std_logic;
     
begin
DEBOUNCER_MINUTE: MPG port map (M_bef, CLK, M);
DEBOUNCER_SECUNDE: MPG port map (S_bef, CLK, S);
DEBOUNCER_START: MPG port map (START_bef, CLK, START);

ONESECONDCLOCK: ClockDivider port map (CLK, CLK_SEC);


STARE_NUMARATOR_MINUTE <= (others => '0');
STARE_NUMARATOR_SECUNDE <= (others => '0');
TIMER_ON <= '0';
MODE_MINUTE <= '0';

    process(CLK_SEC, M, S, START)
    begin 
        COUNTING_STATUS <= '1'; --set counting on by default 
        END_PROCESS <= '0'; --it has to be 0 everytime the process starts so it can loop multiple times
      
        
        if START = '1' then
        TIMER_ON <= '1';
        end if; 
        while TIMER_ON = '1' loop
            if MODE_SECUNDE = '0' then
                while S /= '1' loop
                
                --exit to leave the process 3/3
                if END_PROCESS = '1' then
                exit;
                end if;
                --wait for seconds button
                    if MODE_MINUTE = '0' then
                        while M /= '1' or MODE_MINUTE = '0' loop
                            --exit to leave the process 2/3
                            if END_PROCESS = '1' then
                            exit;
                            end if;
                            --wait for minutes button
                            if START = '1' then
                            COUNTING_STATUS <= '1';
                            end if;
                            if COUNTING_STATUS <= '1' then
                                while START /= '1' loop
                                    if M = '1' then
                                    MODE_MINUTE <= '1';
                                    exit;
                                    end if;
                                    --second is enabled and minute is disabled everytime the process is triggered
                                    ENABLE_COUNTER_SECUNDE <= '1';
                                    ENABLE_COUNTER_MINUTE  <= '0';
                                    if rising_edge(CLK_SEC) then
                                        -- 99 min and 59 sec limit
                                        if STARE_NUMARATOR_MINUTE = "01100011" and STARE_NUMARATOR_SECUNDE = "00111011" then
                                            STARE_NUMARATOR_SECUNDE <= (others => '0'); --back to ZERO
                                            STARE_NUMARATOR_MINUTE <= (others => '0');
                                        end if;
                                           
                                        --reset for seconds if it reaches 59 and start
                                        if STARE_NUMARATOR_SECUNDE =  "00111011" then
                                            STARE_NUMARATOR_SECUNDE <= (others => '0');
                                            ENABLE_COUNTER_MINUTE <= '1';
                                            ENABLE_COUNTER_SECUNDE <= '0';
                                        end if;
                                           
                                        --exit for counters (components)
                                        if ENABLE_COUNTER_SECUNDE = '1' or ENABLE_COUNTER_MINUTE = '1' then
                                            END_PROCESS <= '1';
                                            exit;   --exit to leave the process 1/3
                                        end if;             
                                    end if;
                                end loop;
                            end if;
                            -- if START is pressed again it exits the loop
                            --WAIT LOOP based on COUNTING_STATUS
                            COUNTING_STATUS <= '0';
                        end loop;
                        end if;
                        --LOOP FOR MINUTES BUTTON
                        ENABLE_COUNTER_SECUNDE <= '0';
                        ENABLE_COUNTER_MINUTE <= '0';
                        MODE_MINUTE <= '1';
                        
                        --if START is pressed start decreasing
                        if START = '1' then
                            DECREASE_MODE <= '1';
                            exit;
                        end if;
                        --need to set up a way to decrease the timer till it reaches the ZERO state
                        --increase without rising_edge() bcs its not based on clk
                         if M = '1' then 
                            ENABLE_COUNTER_MINUTE <= '1';
                            END_PROCESS <= '1';
                            exit;
                        end if;
                        
                end loop;
            end if;
            --LOOP FOR SECONDS BUTTON
            ENABLE_COUNTER_SECUNDE <= '0';
            MODE_SECUNDE <= '1';
            
            if DECREASE_MODE = '1' then
                --implement a count down in time
                MODE <=  "10";
                ENABLE_COUNTER_MINUTE <= '0';
                ENABLE_COUNTER_SECUNDE <= '1';
                --verifying if it reaches ZERO
               if rising_edge(CLK_SEC) then
                    if STARE_NUMARATOR_SECUNDE = "00000000" and STARE_NUMARATOR_MINUTE = "00000000" then
                        TIMER_ON <= '0';
                        exit;
                    end if;
                    
                    --we verify if the seconds reached ZERO
                    if STARE_NUMARATOR_SECUNDE = "00000000" then
                        STARE_NUMARATOR_SECUNDE <= "00111011";
                       ENABLE_COUNTER_MINUTE <= '1';
                        ENABLE_COUNTER_SECUNDE <= '0';
                    end if;
                    
                    else ENABLE_COUNTER_SECUNDE <= '1';
                    if ENABLE_COUNTER_SECUNDE = '1' or ENABLE_COUNTER_MINUTE = '1' then
                        exit;
                    end if;
               end if;
            end if;
            
            if START = '1' then
                DECREASE_MODE <= '1';
                exit;
            end if;
            
            if S = '1' then
                ENABLE_COUNTER_SECUNDE <= '1';
                exit;
            end if;
         end loop; 
    end process;
    
    SECUNDE: counter_reversibil port map (STARE_NUMARATOR_SECUNDE, MODE, CLK, ENABLE_COUNTER_SECUNDE, STARE_NUMARATOR_SECUNDE);
    MINUTE: counter_reversibil port map (STARE_NUMARATOR_MINUTE, MODE, CLK, ENABLE_COUNTER_MINUTE, STARE_NUMARATOR_MINUTE);
    
    Q_M <= STARE_NUMARATOR_MINUTE;
    Q_S <= STARE_NUMARATOR_SECUNDE;
    
end Behavioral;
