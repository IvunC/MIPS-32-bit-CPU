library ieee; use ieee.std_logic_1164.all; use ieee.numeric_std.all;
--Created By Ivan Contreras

--ports are same as the ones seen in the figure
entity registerFile is 
	port (
		regWriteSig : in std_logic;
		readReg1, readReg2, writeReg : in std_logic_vector (4 downto 0);
		writeData : in std_logic_vector (31 downto 0);
		readData1, readData2 : out std_logic_vector (31 downto 0)
	);
end registerFile;
	
architecture  behavioral of registerFile is 
	--32 x 32 bit memory for 32 registers
	type reg_mem is array (0 to 31) of std_logic_vector (31 downto 0);	
	
	--registers have data value based on the register they are
	--mainly to differentiate them and to have values for the alu
	signal reg_array: reg_mem := (
		x"00000000",
		x"00000001",
		x"00000002",
		x"00000003",
		x"00000004",
		x"00000005",
		x"00000006",
		x"00000007",
		x"00000008",
		x"00000009",
		x"0000000A",
		x"0000000B",
		x"0000000C",
		x"0000000D",
		x"0000000E",
		x"0000000F",
		x"00000010",
		x"00000011",
		x"00000012",
		x"00000013",
		x"00000014",
		x"00000015",
		x"00000016",
		x"00000017",
		x"00000018",
		x"00000019",
		x"0000001A",
		x"0000001B",
		x"0000001C",
		x"0000001D",
		x"0000001E",
		x"0000001F"	
		);
	begin
		--when regWriteSig is 1, we store the writeData into the register defined by
			--writeReg, becomes data -> Register[writeReg]
		reg_array(to_integer(unsigned(writeReg))) <= writeData when regWriteSig = '1';
		-- output data in two registers based  on the readReg inputs from instruction
		readData1 <= reg_array(to_integer(unsigned(readReg1)));
		readData2 <= reg_array(to_integer(unsigned(readReg2)));

end behavioral;
		
