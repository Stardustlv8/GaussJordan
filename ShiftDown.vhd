library IEEE;
use IEEE.std_logic_1164.all;

entity shiftDown is
	port(
	--input: x, the number to be shifted
	--	 n, the number of bits to shift to the right
	--output: xn, shifted down, rounding instead of truncating
		x: IN std_logic_vector(15 downto 0);
		n: IN std_logic_vector(15 downto 0);
		xn: OUT std_logic_vector(15 downto 0));


