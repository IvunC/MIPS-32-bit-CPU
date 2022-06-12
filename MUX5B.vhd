library ieee; use ieee.std_logic_1164.all;
--Created By Ivan Contreras
	--two inputs, a select and output
entity MUX5B is 
	port (
		Input0, Input1 : in std_logic_vector (4 downto 0);
		sel : in std_logic;
		Result : out std_logic_vector (4 downto 0)
	);
end MUX5B;
-- a standard mux where inputs are 5 bits for the writeRegister mux
architecture structural of MUX5B is 
	begin
		Result <= 	Input0 when sel = '0' else
					Input1;
end structural;
