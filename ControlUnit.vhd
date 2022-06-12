library ieee; use ieee.std_logic_1164.all; use ieee.numeric_std.all;
--Created By Ivan Contreras
entity controlUnit is 
	port (
		--input is opCode, all the outputs are signals
		opCode : in std_logic_vector (5 downto 0);
		regDst, jump, branch, memRead, memToReg, 
			memWrite, aluSrc, regWrite : out std_logic;
		aluOP : out  std_logic_vector(1 downto 0)
	);
end controlUnit;

architecture behavioral of controlUnit is 
	begin
		--whenever the opCode changed, signal the process
		process(opCode)
		begin		--set all to 0 before instruction occurs
					RegDst		<= '0';
					jump 		<= '0';
					branch 		<= '0';
					memRead	 	<= '0';
					memToReg 	<= '0';
					aluOp	  	<= "00";
					memWrite 	<= '0';
					aluSrc 		<= '0';
					regWrite	<= '0';
			case opCode is 
					
				when "000000" =>		-- R type instruction
					RegDst		<= '1';
					jump 		<= '0';
					branch 		<= '0';
					memRead	 	<= '0';
					memToReg 	<= '0';
					aluOp	  	<= "10";
					memWrite 	<= '0';
					aluSrc 		<= '0';
					regWrite	<= '1';

				when "100111" =>		-- LW instruction
					RegDst		<= '0';
					jump 		<= '0';
					branch 		<= '0';
					memRead	 	<= '1';
					memToReg 	<= '1';
					aluOp	  	<= "00";
					memWrite 	<= '0';
					aluSrc 		<= '1';
					regWrite	<= '1';

				when "101011" =>		--SW instruction
					RegDst		<= 'X';
					jump 		<= '0';
					branch 		<= '0';
					memRead	 	<= '0';
					memToReg 	<= 'X';
					aluOp	  	<= "00";
					memWrite 	<= '1';
					aluSrc 		<= '1';
					regWrite	<= '0';
			
				when "000010" =>		--jump
					RegDst		<= '0';
					jump 		<= '1';
					branch 		<= '0';
					memRead	 	<= '0';
					memToReg 	<= '0';
					aluOp	  	<= "00";
					memWrite 	<= '0';
					aluSrc 		<= '0';
					regWrite	<= '0';
					-- any instructions we dont have yet
				when others =>
					RegDst		<= '0';
					jump 		<= '0';
					branch 		<= '0';
					memRead	 	<= '0';
					memToReg 	<= '0';
					aluOp	  	<= "00";
					memWrite 	<= '0';
					aluSrc 		<= '0';
					regWrite	<= '0';
			end case;
		end process;
end behavioral;