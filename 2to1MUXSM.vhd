library ieee; use ieee.std_logic_1164.all;

entity MUX2to1 is 
	port (
		Input0, Input1 : in std_logic_vector (31 downto 0);
		sel : in std_logic;
		Result : out std_logic_vector (31 downto 0)
	);
end MUX2to1;

architecture structural of MUX2to1 is 
	begin
		Result <= 	Input0 when sel = '0' else
					Input1;
	end structural;
