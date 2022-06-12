library ieee; use ieee.std_logic_1164.all;

--1 bit Ripple Carry Adder Behavioral Model
--By Ivan Contreras

entity RCA is
    port (    
		A, B, Cin : in std_logic;	-- two inputs and Carry in
		S, Cout : out std_logic		-- Summation output and Carry out
    );
end RCA;

architecture behavioral of RCA is 
	begin
		S <= A XOR B XOR Cin;
		Cout <= (A AND B) OR (Cin AND A) or (Cin AND B);
	end behavioral;