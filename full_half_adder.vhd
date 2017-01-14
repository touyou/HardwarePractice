library IEEE;
use IEEE.std_logic_1164.all;

entity FullAdder is
    port (
        a: in std_logic;
        b: in std_logic;
        cin: in std_logic;
        s: out std_logic;
        cout: out std_logic
    );
end FullAdder;

architecture FullAdder_Body of FullAdder is
    component HalfAdder
        port (a: in std_logic; b: in std_logic; s: out std_logic; cout: out std_logic);
    end component;
    for hf1, hf2; HalfAdder use entity work.HalfAdder(HalfAdder_Body);

    signal temp_c1, temp_c2, temp_s: std_logic;
    begin
        hf1: HalfAdder port map(a, b, temp_s, temp_c1);
        hf2: HalfAdder port map(temp_s, cin, s, temp_c2);
        cout <= temp_c1 or temp_c2;
    end FullAdder_Body;
