library IEEE;
use IEEE.std_logic_1164.all;

entity HalfAdder is
    port (
    A: in std_logic;
    B: in std_logic;
    S: out std_logic;
    C: out std_logic );
end HalfAdder;

architecture HalfAdder_Body of HalfAdder is
begin
    S <= A xor B;
    C <= A and B;
end HalfAdder_Body;
