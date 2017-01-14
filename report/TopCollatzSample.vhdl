Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;
--use IEEE.std_logic_arith.all;
-- Designed by Yoshinao Kobayashi 20161225
-- Edited by Yosuke Fujii

entity TopCollatz is
end TopCollatz;

architecture SIM of TopCollatz is

	signal CLK	:std_logic:= '0';
	signal reset	:std_logic:= '0';
	signal Go	:std_logic:= '0';
	signal Din	:std_logic_vector(7 downto 0) :=(others => '0');
	signal Dout 	:std_logic_vector(7 downto 0) :=(others => '0');
	signal Done	:std_logic := '0';


	component Collatz
		port(
			CLK	:in std_logic:= '0';
			reset	:in std_logic:= '0';
			Go	:in std_logic:= '0';
			Din	:in std_logic_vector(7 downto 0) := (others => '0');
			Dout 	:out std_logic_vector(7 downto 0) :=(others => '0');
			Done	:out std_logic := '0'
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

process begin
	CLK <= '1';
	wait for 10 ns;
	CLK <= '0';
	wait for 10 ns;
end process ;

process begin
	wait for 5 ns;
	reset <= '1';
	Din <= "11100111";
	wait for 40 ns;
	reset <= '0';
	Go <= '1';
	wait for 40 ns;
	Go <= '0';
	wait for 5500 ns;
	end process;


end;
