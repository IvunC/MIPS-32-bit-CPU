library ieee; use ieee.std_logic_1164.all;
--Created By Ivan Contreras 
entity thirtyTwoBitALUTB is
end thirtyTwoBitALUTB;

--testing the alu 
architecture behavior of thirtyTwoBitALUTB is
	--bringing in the 32 bit alu
    component thirtyTwoBitALU is		
	port (
		A, B : in std_logic_vector (31 downto 0);
		Cin, Less : in std_logic;
		OpSel, Invert : in std_logic_vector (1 downto 0);
		Cout, SET, Zero : out std_logic;
		Result : out std_logic_vector (31 downto 0)
	);
    end component;
	--start all inputs to 0
    signal A,B : std_logic_vector (31 downto 0) :=  x"00000000";
	signal Cin, Less : std_logic := '0';
	signal OpSel, Invert : std_logic_vector (1 downto 0) := "00";
	signal Cout, SET, Zero : std_logic;
    signal Result : std_logic_vector (31 downto 0);
	
begin	
    uut: entity work.thirtyTwoBitALU PORT MAP (  
	--mapping all the inputs and outputs
	A => A,	B => B,Cin => Cin, Less => Less,
	OpSel => OpSel,Invert => Invert,
	Cout => Cout, SET => SET,
	Result => Result, Zero => Zero 
    );
    stim : process	
    begin
		--give A and B random values
		-- go through all operations and check results
		A <= x"00000013";
		B <= x"00001738";
		Less <= '0';
	    	
		--And
		OpSel <= "00";
		Invert <= "00";
	    	wait for 100 ns;
		--Or
		OpSel <= "01";
		Invert <= "00";
	    	wait for 100 ns;
		--Add
		OpSel <= "10";
		Invert <= "00";
			wait for 100 ns;
		--Sub
		Cin <= '1';
		OpSel <= "10";
		Invert <= "01";
	   		wait for 100 ns;
		--Nor
		Cin <= '0';
		OpSel <= "00";
		Invert <= "11";
	    	wait for 100 ns;
		--Slt
		Cin <= '1';
		OpSel <= "11";
		Invert <= "01";
	    	wait for 100 ns;
    end process;	
end behavior;