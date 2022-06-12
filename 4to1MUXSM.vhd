library ieee; use ieee.std_logic_1164.all;

entity MUX4to1 is 
	port (
		Input0,Input1, Input2, Input3 : in std_logic_vector (31 downto 0);
		OpSel : in std_logic_vector (1 downto 0);
		Result : out std_logic_vector (31 downto 0)
	);
end MUX4to1;

architecture structural of MUX4to1 is 
	begin
		Result <= 	Input0 when OpSel = "00" else
					Input1 when OpSel = "01" else
					Input2 when OpSel = "10" else
					Input3;
		
	end structural;