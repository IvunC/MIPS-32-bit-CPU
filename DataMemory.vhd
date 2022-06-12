library ieee; use ieee.std_logic_1164.all; use ieee.numeric_std.all;
--Created By Ivan Contreras
--ports in dataMem are as seen in the figure, memWrite/memRead are input signals
	--the rest are of 32 bits
entity dataMemory is 
	port (
		address, writeData : in std_logic_vector (31 downto 0);
		memWrite, memRead : in std_logic;
		readData : out std_logic_vector (31 downto 0)
	);
end dataMemory;

architecture behavioral of dataMemory is 
	--32 x 32 bit memory
	type data_mem is array (0 to 31) of std_logic_vector (31 downto 0);	
	--making all of the dataMemory 0 to begin with
	signal memBlock : data_mem := (
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000"	
		);

	begin
		--when writing, put the writeData into memory block
		memBlock(to_integer(unsigned(address))/4) <= writeData when memWrite = '1';
		--when read is 1, output memory block index given by address to readData
		readData <= memBlock(to_integer(unsigned(address))/4) when memRead = '1';
		

end behavioral;
