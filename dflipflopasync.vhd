library IEEE;
use IEEE.std_logic_1164.all;

entity D_FF is
    port (
    D :in std_logic_vector(7 downto 0);
    CLK :in std_logic;
    RESET :in std_logic;
    WE :in std_logic;
    Q :out std_logic_vector(7 downto 0) );
end D_FF;

architecture D_FF_Body of D_FF is
    signal DBUF : std_logic_vector(7 downto 0);
begin
    process(CLK, RESET)
    begin
        if RESET = '1' then
            DBUF <= "00000000";
        elsif CLK'event and CLK = '1' then
            if WE = '1' then
                DBUF <= D;
            end if;
        end if;
    end process;
    Q <= DBUF;
end D_FF_Body;
