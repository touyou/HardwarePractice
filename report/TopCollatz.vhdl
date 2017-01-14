library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;
-- Designed by Yosuke Fujii
-- Base: Lecture Sample

entity TopCollatz is
    port(
        count1 :inout std_logic_vector(7 downto 0) := (others => '0');
        data1 :inout std_logic_vector(7 downto 0) := (others => '0');
        count2 :inout std_logic_vector(7 downto 0) := (others => '0');
        data2 :inout std_logic_vector(7 downto 0) := (others => '0');
        count3 :inout std_logic_vector(7 downto 0) := (others => '0');
        data3 :inout std_logic_vector(7 downto 0) := (others => '0');
        count4 :inout std_logic_vector(7 downto 0) := (others => '0');
        data4 :inout std_logic_vector(7 downto 0) := (others => '0');
        count5 :inout std_logic_vector(7 downto 0) := (others => '0');
        data5 :inout std_logic_vector(7 downto 0) := (others => '0');
        count6 :inout std_logic_vector(7 downto 0) := (others => '0');
        data6 :inout std_logic_vector(7 downto 0) := (others => '0');
        count7 :inout std_logic_vector(7 downto 0) := (others => '0');
        data7 :inout std_logic_vector(7 downto 0) := (others => '0');
        count8 :inout std_logic_vector(7 downto 0) := (others => '0');
        data8 :inout std_logic_vector(7 downto 0) := (others => '0');
        count9 :inout std_logic_vector(7 downto 0) := (others => '0');
        data9 :inout std_logic_vector(7 downto 0) := (others => '0');
        count10 :inout std_logic_vector(7 downto 0) := (others => '0');
        data10 :inout std_logic_vector(7 downto 0) := (others => '0');
        count11 :inout std_logic_vector(7 downto 0) := (others => '0');
        data11 :inout std_logic_vector(7 downto 0) := (others => '0');
        count12 :inout std_logic_vector(7 downto 0) := (others => '0');
        data12 :inout std_logic_vector(7 downto 0) := (others => '0');
        count13 :inout std_logic_vector(7 downto 0) := (others => '0');
        data13 :inout std_logic_vector(7 downto 0) := (others => '0');
        count14 :inout std_logic_vector(7 downto 0) := (others => '0');
        data14 :inout std_logic_vector(7 downto 0) := (others => '0');
        count15 :inout std_logic_vector(7 downto 0) := (others => '0');
        data15 :inout std_logic_vector(7 downto 0) := (others => '0');
        count16 :inout std_logic_vector(7 downto 0) := (others => '0');
        data16 :inout std_logic_vector(7 downto 0) := (others => '0')
    );
end TopCollatz;

architecture SIM of TopCollatz is

    signal CLK :std_logic := '0';
    signal reset :std_logic := '0';
    signal Go :std_logic := '0';
    signal Din :std_logic_vector(7 downto 0) := (others => '0');
    signal Dout :std_logic_vector(7 downto 0) := (others => '0');
    signal Done :std_logic := '0';
    signal isSorting :std_logic := '1';

    component Collatz
        port(
            CLK :in std_logic := '0';
            reset :in std_logic := '0';
            Go :in std_logic := '0';
            Din :in std_logic_vector(7 downto 0) := (others => '0');
            Dout :out std_logic_vector(7 downto 0) := (others => '0');
            Done :out std_logic := '0'
        );
    end component;

begin

    CL : Collatz port map(
        CLK => CLK,
        reset => reset,
        Go => Go,
        Din => Din,
        Dout => Dout,
        Done => Done
    );

    -- System Clock
    process begin
        CLK <= '1';
        wait for 10 ns;
        CLK <= '0';
        wait for 10 ns;
    end process;

    process begin
        if (isSorting = '1') then
            wait for 5 ns;
            reset <= '1';
            Din <= Din + 1;
            wait for 40 ns;
            reset <= '0';
            Go <= '1';
            wait for 40 ns;
            Go <= '0';
            wait for 3900 ns;
            -- Sort
            if (Dout > count1) then
                count16 <= count15;
                data16 <= data15;
                count15 <= count14;
                data15 <= data14;
                count14 <= count13;
                data14 <= data13;
                count13 <= count12;
                data13 <= data12;
                count12 <= count11;
                data12 <= data11;
                count11 <= count10;
                data11 <= data10;
                count10 <= count9;
                data10 <= data9;
                count9 <= count8;
                data9 <= data8;
                count8 <= count7;
                data8 <= data7;
                count7 <= count6;
                data7 <= data6;
                count6 <= count5;
                data6 <= data5;
                count5 <= count4;
                data5 <= data4;
                count4 <= count3;
                data4 <= data3;
                count3 <= count2;
                data3 <= data2;
                count2 <= count1;
                data2 <= data1;
                count1 <= Dout;
                data1 <= Din;
            elsif (Dout > count2) then
                count16 <= count15;
                data16 <= data15;
                count15 <= count14;
                data15 <= data14;
                count14 <= count13;
                data14 <= data13;
                count13 <= count12;
                data13 <= data12;
                count12 <= count11;
                data12 <= data11;
                count11 <= count10;
                data11 <= data10;
                count10 <= count9;
                data10 <= data9;
                count9 <= count8;
                data9 <= data8;
                count8 <= count7;
                data8 <= data7;
                count7 <= count6;
                data7 <= data6;
                count6 <= count5;
                data6 <= data5;
                count5 <= count4;
                data5 <= data4;
                count4 <= count3;
                data4 <= data3;
                count3 <= count2;
                data3 <= data2;
                count2 <= Dout;
                data2 <= Din;
            elsif (Dout > count3) then
                count16 <= count15;
                data16 <= data15;
                count15 <= count14;
                data15 <= data14;
                count14 <= count13;
                data14 <= data13;
                count13 <= count12;
                data13 <= data12;
                count12 <= count11;
                data12 <= data11;
                count11 <= count10;
                data11 <= data10;
                count10 <= count9;
                data10 <= data9;
                count9 <= count8;
                data9 <= data8;
                count8 <= count7;
                data8 <= data7;
                count7 <= count6;
                data7 <= data6;
                count6 <= count5;
                data6 <= data5;
                count5 <= count4;
                data5 <= data4;
                count4 <= count3;
                data4 <= data3;
                count3 <= Dout;
                data3 <= Din;
            elsif (Dout > count4) then
                count16 <= count15;
                data16 <= data15;
                count15 <= count14;
                data15 <= data14;
                count14 <= count13;
                data14 <= data13;
                count13 <= count12;
                data13 <= data12;
                count12 <= count11;
                data12 <= data11;
                count11 <= count10;
                data11 <= data10;
                count10 <= count9;
                data10 <= data9;
                count9 <= count8;
                data9 <= data8;
                count8 <= count7;
                data8 <= data7;
                count7 <= count6;
                data7 <= data6;
                count6 <= count5;
                data6 <= data5;
                count5 <= count4;
                data5 <= data4;
                count4 <= Dout;
                data4 <= Din;
            elsif (Dout > count5) then
                count16 <= count15;
                data16 <= data15;
                count15 <= count14;
                data15 <= data14;
                count14 <= count13;
                data14 <= data13;
                count13 <= count12;
                data13 <= data12;
                count12 <= count11;
                data12 <= data11;
                count11 <= count10;
                data11 <= data10;
                count10 <= count9;
                data10 <= data9;
                count9 <= count8;
                data9 <= data8;
                count8 <= count7;
                data8 <= data7;
                count7 <= count6;
                data7 <= data6;
                count6 <= count5;
                data6 <= data5;
                count5 <= Dout;
                data5 <= Din;
            elsif (Dout > count6) then
                count16 <= count15;
                data16 <= data15;
                count15 <= count14;
                data15 <= data14;
                count14 <= count13;
                data14 <= data13;
                count13 <= count12;
                data13 <= data12;
                count12 <= count11;
                data12 <= data11;
                count11 <= count10;
                data11 <= data10;
                count10 <= count9;
                data10 <= data9;
                count9 <= count8;
                data9 <= data8;
                count8 <= count7;
                data8 <= data7;
                count7 <= count6;
                data7 <= data6;
                count6 <= Dout;
                data6 <= Din;
            elsif (Dout > count7) then
                count16 <= count15;
                data16 <= data15;
                count15 <= count14;
                data15 <= data14;
                count14 <= count13;
                data14 <= data13;
                count13 <= count12;
                data13 <= data12;
                count12 <= count11;
                data12 <= data11;
                count11 <= count10;
                data11 <= data10;
                count10 <= count9;
                data10 <= data9;
                count9 <= count8;
                data9 <= data8;
                count8 <= count7;
                data8 <= data7;
                count7 <= Dout;
                data7 <= Din;
            elsif (Dout > count8) then
                count16 <= count15;
                data16 <= data15;
                count15 <= count14;
                data15 <= data14;
                count14 <= count13;
                data14 <= data13;
                count13 <= count12;
                data13 <= data12;
                count12 <= count11;
                data12 <= data11;
                count11 <= count10;
                data11 <= data10;
                count10 <= count9;
                data10 <= data9;
                count9 <= count8;
                data9 <= data8;
                count8 <= Dout;
                data8 <= Din;
            elsif (Dout > count9) then
                count16 <= count15;
                data16 <= data15;
                count15 <= count14;
                data15 <= data14;
                count14 <= count13;
                data14 <= data13;
                count13 <= count12;
                data13 <= data12;
                count12 <= count11;
                data12 <= data11;
                count11 <= count10;
                data11 <= data10;
                count10 <= count9;
                data10 <= data9;
                count9 <= Dout;
                data9 <= Din;
            elsif (Dout > count10) then
                count16 <= count15;
                data16 <= data15;
                count15 <= count14;
                data15 <= data14;
                count14 <= count13;
                data14 <= data13;
                count13 <= count12;
                data13 <= data12;
                count12 <= count11;
                data12 <= data11;
                count11 <= count10;
                data11 <= data10;
                count10 <= Dout;
                data10 <= Din;
            elsif (Dout > count11) then
                count16 <= count15;
                data16 <= data15;
                count15 <= count14;
                data15 <= data14;
                count14 <= count13;
                data14 <= data13;
                count13 <= count12;
                data13 <= data12;
                count12 <= count11;
                data12 <= data11;
                count11 <= Dout;
                data11 <= Din;
            elsif (Dout > count12) then
                count16 <= count15;
                data16 <= data15;
                count15 <= count14;
                data15 <= data14;
                count14 <= count13;
                data14 <= data13;
                count13 <= count12;
                data13 <= data12;
                count12 <= Dout;
                data12 <= Din;
            elsif (Dout > count13) then
                count16 <= count15;
                data16 <= data15;
                count15 <= count14;
                data15 <= data14;
                count14 <= count13;
                data14 <= data13;
                count13 <= Dout;
                data13 <= Din;
            elsif (Dout > count14) then
                count16 <= count15;
                data16 <= data15;
                count15 <= count14;
                data15 <= data14;
                count14 <= Dout;
                data14 <= Din;
            elsif (Dout > count15) then
                count16 <= count15;
                data16 <= data15;
                count15 <= Dout;
                data15 <= Din;
            elsif (Dout > count16) then
                count16 <= Dout;
                data16 <= Din;
            end if;
        end if;
    end process;
    Done <= '0';
    isSorting <= '0' when (Din = "11111111") else '1';
end architecture;
