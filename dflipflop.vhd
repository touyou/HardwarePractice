library IEEE;
use IEEE.std_logic_1164.all;

entity D_FF is
    port (
    D :in std_logic;
    CLK :in std_logic;
    Q :out std_logic );
end D_FF;

architecture D_FF_Body of D_FF is
    signal DBUF: std_logic;
begin
    process(CLK)
    begin
        if CLK'event and CLK = '1' then
            DBUF <= D;
        end if;
    end process;
    Q <= DBUF;
end D_FF_Body;
