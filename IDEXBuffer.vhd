library ieee; use ieee.std_logic_1164.all;
--Created By Ivan Contreras
--Inputs, stores, and outputs signals when the rising edge
--inputs are pc, and the control unit signals, and register values
entity idexBuffer is 
	port (
		clk : in std_logic;
		pc_in, signExtend_in, reg1_in, reg2_in, jumpAddr_in  : in std_logic_vector (31 downto 0);
		regDst_in, branch_in, jump_in, memRead_in, memToReg_in, memWrite_in, aluSrc_in, regWrite_in : in std_logic;
		aluOP_in : in std_logic_vector (1 downto 0);
		aluControl_in : in std_logic_vector (5 downto 0);
		regRT_in, regRD_in : in std_logic_vector (4 downto 0);

		pc_out, signExtend_out, reg1_out, reg2_out, jumpAddr_out : out std_logic_vector (31 downto 0);
		regDst_out, branch_out, jump_out, memRead_out, memToReg_out, memWrite_out, aluSrc_out, regWrite_out : out std_logic;
		aluOP_out : out std_logic_vector (1 downto 0); 
		aluControl_out : out std_logic_vector (5 downto 0);
		regRT_out, regRD_out : out std_logic_vector (4 downto 0)
		
	);
end idexBuffer;

architecture behavioral of idexBuffer is 
	begin
		--when clock is 1, update all the values
		process(clk)
		begin
			if (clk = '1') then
				pc_out <= pc_in;
				jumpAddr_out <= jumpAddr_in;
				jump_out <= jump_in;
				signExtend_out <= signExtend_in;
				reg1_out <= reg1_in;
				reg2_out <= reg2_in;
				regDst_out <= regDst_in;
				branch_out <= branch_in;
				memRead_out <= memRead_in;
				memToReg_out <= memToReg_in;
				memWrite_out <= memWrite_in;
				aluSrc_out <= aluSrc_in;
				regWrite_out <= regWrite_in;
				aluOP_out <= aluOP_in;
				aluControl_out <= aluControl_in;
				regRT_out <= regRT_in;
				regRD_out <= regRD_in;
			end if;
		end process;
end behavioral;
