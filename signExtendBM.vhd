library ieee; use ieee.std_logic_1164.all;
--Created By Ivan Contreras
--turn 16 bit input to 32 bit output
entity signExtend is 
	port (
		input : in std_logic_vector (15 downto 0);
		output : out std_logic_vector (31 downto 0)
	);
end signExtend;

architecture behavioral of signExtend is 
	--upper 16 bits become what the 16th bit value is
	begin
		output(15 downto 0) <= input;
		output(31 downto 16) <= x"0000" when input(15) = '0' else
								x"FFFF";							
	 
end behavioral;
