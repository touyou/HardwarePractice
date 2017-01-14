library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
-- Designed by Yosuke Fujii
-- Base: Lecture Sample

-- CLK ... System Clock
-- Go ... Start signal
-- Dreg ... Data (Din = input, Dout = output)
-- Counter ... Counter
-- reset ... Reset Signal
-- Done ... End Signal
-- CCycle ... State of Calculation (1 is runnning)

entity Collatz is
    port (
        CLK :in std_logic := '0';
        reset :in std_logic := '0';
        Go :in std_logic := '0';
        Din :in std_logic_vector(7 downto 0) := (others => '0');
        Dout :out std_logic_vector(7 downto 0) := (others => '0');
        Done :out std_logic := '0'
    );
end Collatz;

architecture RTL of Collatz is

    signal Dreg :std_logic_vector(15 downto 0) := (others => '0');
    signal Counter :std_logic_vector(7 downto 0) := (others => '0');
    signal CCycle :std_logic_vector(1 downto 0) := "00";
    signal NoData :std_logic := '0';
    signal ToBeEnd :std_logic := '0';

begin
    process begin
    wait until rising_edge(CLK);
    if reset = '1' then
        CCycle <= "00";
    else
        case CCycle(0) is
        when '0' =>
            if Go = '1' then
                CCycle(0) <= '1';
            end if;
        when '1' =>
            if (CCycle(1) = '1' and ToBeEnd = '1') then
                CCycle(0) <= '0';
            end if;
        when others =>
            CCycle(0) <= '0';
        end case;
        CCycle(1) <= CCycle(0);
    end if;

    -- CCycle == '01' : start
    -- CCycle == '11' : running
    if (CCycle = "01") then
        Dreg <= "00000000" & Din; -- extend
        Counter <= "00000000";
    elsif CCycle = "11" then
        if (NoData = '1') then
            -- Not Started
            Dreg <= ('0' & Dreg(15 downto 1));
        elsif (Dreg(0) = '0') then
            -- Even
            Dreg <= ('0' & Dreg(15 downto 1));
            Counter <= Counter + 1;
        else
            -- Odd
            Dreg <= Dreg + ('0' & Dreg(15 downto 1)) + 1;
            Counter <= Counter + 2;
        end if;
    end if;
    end process;

    Done <= '1' when CCycle = "10" else '0';
    Dout <= Counter;

    NoData <= '1' when (Dreg = "0000000000000000" or Dreg = "0000000000000001") else '0';
    ToBeEnd <= '1' when (Dreg = "0000000000000000" or Dreg = "0000000000000001" or Dreg = "0000000000000010") else '0';
end RTL;
