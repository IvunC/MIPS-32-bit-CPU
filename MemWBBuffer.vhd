library ieee; use ieee.std_logic_1164.all;

entity memWbBuffer is 
	port (
		clk : in std_logic;

		
		memToReg_in, regWrite_in : in std_logic;
		aluResult_in, readData_in : in std_logic_vector (31 downto 0);
		writeReg_in : in std_logic_Vector (4 downto 0);

		
		memToReg_out, regWrite_out : out std_logic;
		aluResult_out, readData_out : out std_logic_vector (31 downto 0);
		writeReg_out : out std_logic_vector (4 downto 0)
	);
end memWbBuffer ;

architecture behavioral of memWbBuffer  is 
	begin
		
		process(clk)
		begin
			if (clk = '1') then
			
				memToReg_out <= memToReg_in;
			
				regWrite_out <= regWrite_in;	

				aluResult_out <= aluResult_in;
				readData_out <= readData_in;
				writeReg_out <= writeReg_in;
			end if;
		end process;
end behavioral;
