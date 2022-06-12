library ieee; use ieee.std_logic_1164.all; 
--Created By Ivan Contreras

--ports are as seen in figure
entity aluControl is 
	port (
		aluOP : in std_logic_vector (1 downto 0);
		functionCode : in std_logic_vector (5 downto 0);
		aluOutput : out std_logic_vector (3 downto 0)
	);
end aluControl;

architecture behavioral of aluControl is 
	--calculations obtained from Lecture 8
	begin
		aluOutput(3) <=  '0';
		aluOutput(2) <= aluOP(0) or (aluOp(1) and functionCode(1));
		aluOutput(1) <= (not aluOP(1) or not functionCode(2));
		aluOutput(0) <= aluOp(1) and (functionCode(3) or functionCode(0));
		
		
end behavioral;
