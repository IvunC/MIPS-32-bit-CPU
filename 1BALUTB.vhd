library ieee; use ieee.std_logic_1164.all;

entity oneBitALUTB is
end oneBitALUTB;

architecture behavior of oneBitALUTB is
    component ALU is		
	port(			
	    A, B, Cin : in std_logic;
		Less : in std_logic;
		Invert : in std_logic_vector (1 downto 0);
		OpSel : in std_logic_vector (1 downto 0);
		Cout : out std_logic;
		And_Out : out std_logic;
		Or_Out : out std_logic;
		Adder_Out : out std_logic
	);
    end component;
				
    signal A,B : std_logic := '0';
    signal Cin : std_logic := '0';
	signal Less : std_logic := '0';
	signal Invert : std_logic_vector (1 downto 0) := "00";
	signal OpSel : std_logic_vector (1 downto 0) := "00";
    signal Cout, And_Out, Or_Out, Adder_Out : std_logic;


begin	--mapping all testbench ports to CLA ports
    uut: entity work.alu PORT MAP (  
	A => A,	B => B,Cin => Cin, Less => Less,
	Invert => Invert,
	OpSel => OpSel,Cout => Cout,
	And_Out => And_Out, Or_Out => Or_Out,
	Adder_Out => Adder_Out 
    );
    stim : process	
    begin
	A <= '1';
	B <= '0';
	    wait for 100 ns;
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
	OpSel <= "10";
	Invert <= "01";
	    wait for 100 ns;
	--Nor
	OpSel <= "00";
	Invert <= "11";
	    wait for 100 ns;
    end process;	
end behavior;
