library ieee; use ieee.std_logic_1164.all;
--Created By Ivan Contreras
entity shiftLeft2 is 
	--only an input and output
	port (
		input : in std_logic_vector (31 downto 0);
		output : out std_logic_vector (31 downto 0)
	);
end shiftLeft2;
	--shift input by two to the left and 2 LSB's become 0
architecture behavioral of shiftLeft2 is 
	begin
		output (31 downto 2) <= input (29 downto 0);
		output (1 downto 0) <= "00";							
	 
end behavioral;
