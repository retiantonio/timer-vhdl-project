library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ClockDivider is
    Port ( clk_in  : in  STD_LOGIC;
           clk_out : out STD_LOGIC);
end ClockDivider;

architecture Behavioral of ClockDivider is
    signal counter: STD_LOGIC_VECTOR(26 downto 0) := (others => '0');
    signal clk_reg: STD_LOGIC := '0';
begin

    process(clk_in)
    begin
        if rising_edge(clk_in) then
            if counter = "101111101011110000100000000" then -- 50,000,000 in binary
                counter <= (others => '0');
                clk_reg <= not clk_reg;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    clk_out <= clk_reg;
--iza - 45 min
--marito - 26 min
end Behavioral;
