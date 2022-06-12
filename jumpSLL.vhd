library ieee; use ieee.std_logic_1164.all;
--Created By Ivan Contreras
-- a shift left for jump instructions
entity jumpSLL is 
	port (
		input : in std_logic_vector (25 downto 0);
		output : out std_logic_vector (27 downto 0)
	);
end jumpSLL;

architecture behavioral of jumpSLL is 
	--input is 26 bits, shift it to 28, upper 4 are from pc
	begin
		output (27 downto 2) <= input (25 downto 0);
		output (1 downto 0) <= "00";							
	 
end behavioral;
