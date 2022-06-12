library ieee; use ieee.std_logic_1164.all; use ieee.numeric_std.all;
--Created By Ivan Contreras
entity instructionMemory is
	--input is pc, outputs instruction based on pc 
	port (
		currentPC : in std_logic_vector (31 downto 0);
		instruction : out std_logic_vector (31 downto 0)
	);
end instructionMemory;

architecture behavioral of instructionMemory is 
	--32 x 32 bit memory
	type instr_mem is array (0 to 31) of std_logic_vector (31 downto 0);	
	
	signal memBlock : instr_mem := (
		--hard coded 10 minimum instructions

											  --starts at 0x0000 2710
		"00000010001100111001000000100010",			--PC: 0x0000 0000 	sub $s2, $s1, $s3
		"00000010010011010101000000100000",			--PC: 0x0000 0004	and $t2, $s2, $t5
		"00000010000010100101000000100101",			--PC: 0x0000 0008	or $t2, $s0, $t2
		"00000001001010001001100000100000",			--PC: 0x0000 000C	add1 $s3, $t1, $t0
		"10001110010010110000000001100100",			--PC: 0x0000 0010	lw $t3, 100($s2)
		"00100010011101000000000011001000",			--PC: 0x0000 0014	addi $s4, $t3, 200
		"10101101010010010000000001100100",			--PC: 0x0000 0018	sw $t1, 100($t2)
		"00000010001010000100100000100111",			--PC: 0x0000 001C	nor $t1, $s1, $t0
		"00000010010100100100100000101010",			--PC: 0x0000 0020	slt $t1, $s2, $s2
		"00001000000000000000100111000100",			--PC: 0x0000 0024	j $2500
		"00000000000000000000000000000000",			--PC: 0x0000 0028	
		"00000000000000000000000000000000",			--PC: 0x0000 003C	
		"00000000000000000000000000000000",			--PC: 0x0000 0040	
		"00000000000000000000000000000000",			--PC: 0x0000 0044
		"00000000000000000000000000000000",			--PC: 0x0000 0048
		"00000000000000000000000000000000",			--PC: 0x0000 004C
		"00000000000000000000000000000000",			--PC: 0x0000 0050
		"00000000000000000000000000000000",			--PC: 0x0000 0054
		"00000000000000000000000000000000",			--PC: 0x0000 0058
		"00000000000000000000000000000000",			--PC: 0x0000 005C
		"00000000000000000000000000000000",			--PC: 0x0000 0060
		"00000000000000000000000000000000",			--PC: 0x0000 0064
		"00000000000000000000000000000000",			--PC: 0x0000 0068
		"00000000000000000000000000000000",			--PC: 0x0000 006C
		"00000000000000000000000000000000",			--PC: 0x0000 0070
		"00000000000000000000000000000000",			--PC: 0x0000 0074
		"00000000000000000000000000000000",			--PC: 0x0000 0078
		"00000000000000000000000000000000",			--PC: 0x0000 007C
		"00000000000000000000000000000000",			--PC: 0x0000 0080
		"00000000000000000000000000000000",			--PC: 0x0000 0084
		"00000000000000000000000000000000",			--PC: 0x0000 0088
		"00000000000000000000000000000000"
		--2710 because thats the jump target sll by 2 (10000)in hex
		);

	begin
		process(currentPC)
		begin
			--set instruction according to pc value
			--arithmetic is to bring 2710 downto 0, 2714 to 1, etc
			instruction <= memBlock(to_integer(unsigned(currentPC) - 10000)/4);
		end process;
end behavioral;
--Comments
	-------------sub $s2, $s1, $s3-------------
	--	op 		rs	  rt	rd	functioncode --
	--"000000 10001 10011 10010 00000 100010"--
	-------------and $t2, $s2, $t5-------------
	--	op 		rs	  rt	rd	functioncode -- 
	--"000000 10010 01101 01010 00000 100000"--
	--
	--
	--------------or $t2, $s0, $t2-------------
	--	op 		rs	  rt	rd	functioncode --
	--"000000 10000 01010 01010 00000 100101"--
	--
	------------add1 $s3, $t1, $t0-------------
	--	op 		rs	  rt	rd	functioncode --
	--"000000 01001 01000 10011 00000 100000"--
	--
	--------------lw $t3, 100($s2)-------------
	--	  op	 rs	  rt		offset		 --
	---"100011 10010 01011 0000000001100100"---
	--
	-------------addi $s4, $t3, 200------------
	--	op		 rs    rt 		offset
	---"001000 10011 10100 0000000011001000"---
	--
	--------------sw $t1, 100($t2)-------------
	--	op
	---"101011 01010 01001 0000000001100100"---
	--
	-------------nor $t1, $s1, $t0-------------
	--	op		rs	  rt 	rd	functioncode --
	--"000000 10001 01000 01001 00000 100111"--
	--
	-------------slt $t1, $s2, $s2-------------
	--	op		rs	  rt	rd	functioncode --
	--"000000 10010 10010 01001 00000 101010"--
	-----------------j $2500-------------------
	--	op				immediate 
	----"000010 00000000000000100111000100"----