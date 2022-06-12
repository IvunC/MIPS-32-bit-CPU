library ieee; use ieee.std_logic_1164.all;
--Created By Ivan Contreras

--this bufffer will take in instruction and pc and store
--them until the clock is high edge
entity ifidBuffer is 
	port (
		clk : in std_logic;
		pc_in, instruction_in : in std_logic_vector (31 downto 0);
		pc_out, instruction_out : out std_logic_vector (31 downto 0)
	);
end ifidBuffer;

architecture behavioral of ifidBuffer is 
	begin
		--update when clk is 1/high_edge
		process(clk)
		begin
			if (clk = '1') then
				instruction_out <= instruction_in;
				pc_out <= pc_in;
			end if;
		end process;
end behavioral;