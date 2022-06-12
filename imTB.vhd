library ieee; use ieee.std_logic_1164.all; use ieee.numeric_std.all;
--Created by Ivan Contreras
entity instructionMemoryTB is 
end instructionMemoryTB;
--passing in instructionMemory
architecture behavior of instructionMemoryTB is
    component instructionMemory is		
	port (
		currentPC : in std_logic_vector (31 downto 0);
		instruction : out std_logic_vector (31 downto 0)
	);
    end component;
	--setting currentPC to 0
    signal currentPC : std_logic_vector(31 downto 0) :=  x"00002710";
    signal instruction : std_logic_vector (31 downto 0);
	

begin	
    uut: entity work.instructionMemory PORT MAP (  
	-- connecting ports
	currentPC => currentPC, instruction => instruction
    );
    stim : process	
	--going through all the PC values and seeing the output 
		--instruction
    begin
		currentPC <= x"00002710";
			wait for 25 ns;
		currentPC <= x"00002714";
			wait for 25 ns;
		currentPC <= x"00002718";
			wait for 25 ns;
		currentPC <= x"0000271C";
			wait for 25 ns;
		currentPC <= x"00002720";
			wait for 25 ns;
		currentPC <= x"00002724";
			wait for 25 ns;
		currentPC <= x"00002728";
			wait for 25 ns;
		currentPC <= x"0000272C";
			wait for 25 ns;
		currentPC <= x"00002730";
			wait for 25 ns;
		currentPC <= x"00002734";
			wait for 25 ns;
		currentPC <= x"00002738";
			wait for 25 ns;

    end process;	
end behavior;