library ieee; use ieee.std_logic_1164.all;
--Created By Ivan Contreras
-- this buffer is after the execution
--again pc, the dataMemory signals, alu results
--also has the branch and jump addresses
entity exmemBuffer is 
	port (
		clk : in std_logic;

		pc_in, branchAddr_in, jumpAddr_in : in std_logic_vector (31 downto 0);
		jump_in, memToReg_in,memWrite_in, memRead_in, regWrite_in, branch_in, zeroSig_in : in std_logic;
		aluResult_in, writeData_in : in std_logic_vector (31 downto 0);
		writeReg_in : in std_logic_Vector (4 downto 0);
		
		pc_out, branchAddr_out, jumpAddr_out : out std_logic_vector (31 downto 0);
		jump_out, memToReg_out, memWrite_out, memRead_out, regWrite_out, branch_out, zeroSig_out : out std_logic;
		aluResult_out, writeData_out : out std_logic_vector (31 downto 0);
		writeReg_out : out std_logic_vector (4 downto 0)
	);
end exmemBuffer;

architecture behavioral of exmemBuffer is 
	begin
		-- when clk is 1, update all the variables to new ones
		process(clk)
		begin
			if (clk = '1') then
				pc_out <= pc_in;
				branchAddr_out <= branchAddr_in;
				jumpAddr_out <= jumpAddr_in;
				writeData_out <= writeData_in;
				branch_out <= branch_in;
				jump_out <= jump_in;
				zeroSig_out <= zeroSig_in;
				memToReg_out <= memToReg_in;
				memWrite_out <= memWrite_in;
				memRead_out <= memRead_in;
				regWrite_out <= regWrite_in;	
				aluResult_out <= aluResult_in;
				writeReg_out <= writeReg_in;
			end if;
		end process;
end behavioral;

	
			
          
  