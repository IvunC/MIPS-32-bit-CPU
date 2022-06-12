library ieee; use ieee.std_logic_1164.all;

entity ALU is 
	port (
		A, B, Cin : in std_logic;
		Less : in std_logic;
		Invert : in std_logic_vector (1 downto 0);
		OpSel : in std_logic_vector (1 downto 0);
		Cout : out std_logic;
		And_Out : out std_logic;
		Or_Out : out std_logic;
		Adder_Out : out std_logic
	);
end ALU;

architecture structural of ALU is
	component RCA is 
	port(
	    A : in std_logic;
	    B : in std_logic;
	    Cin : in std_logic;
	    S : out std_logic;
	    Cout : out std_logic
	);
	end component;

	signal AdderOut, WireA, WireB : std_logic;
begin
	
	WireA 	<= A when Invert(1) = '0' else
				(NOT A);
	WireB 	<= B when Invert(0) = '0' else
				(NOT B);

	RCA1 : RCA port map (WireA, WireB, Cin, Adder_Out, Cout);

	And_Out <= WireA and WireB;
	Or_Out <= WireA or WireB;
	end structural;


--	And			OpSel = 00	 	Inverts = 00
--	Or			OpSel = 01		Inverts = 00
-- 	Add 		OpSel = 10		Inverts = 00
--	Sub 		OpSel = 10		Inverts = 01
--	Nor			OpSel = 00		Inverts = 11
--	Slt			OpSel = 11		Inverts = 01