
library ieee; use ieee.std_logic_1164.all;
--Created by Ivan Contreras 
entity thirtyTwoBitALU is
--inputs, result are of 32 bits wide
-- same signals as 1 bit alu
	port (
		A, B : in std_logic_vector (31 downto 0);
		Cin, Less : in std_logic;
		OpSel, Invert : in std_logic_vector (1 downto 0);
		Cout, SET, Zero : out std_logic;
		Result : out std_logic_vector (31 downto 0)
		
	);
end thirtyTwoBitALU;

architecture structural of thirtyTwoBitALU is 
	--bringing in the alu
	component ALU is 
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
	end component;
	--bringing in mux to select result
	component MUX4to1 is 
	port (
		Input0,Input1, Input2, Input3 : in std_logic_vector (31 downto 0);
		OpSel : in std_logic_vector (1 downto 0);
		Result : out std_logic_vector (31 downto 0)
	);
	end component;
	--temporary signals to help with computations
	signal And_Out, Or_Out, Adder_Out, Slt_Out, Output : std_logic_vector (31 downto 0);
	signal SubCarryIn : std_logic;
	signal CarryBits  : std_logic_vector (30 downto 0);
	
begin
	--if B invert is 1 then Carry in is 1 for two's complememnt
	SubCarryIn 	<= 	'1' when (OpSel = "10" and Invert = "01") else
					'1' when (OpSel = "11" and Invert = "01") else
					Cin;
	-- 32 1 bit alu's, linked together by carry bits
	ALU0  : ALU port map (A(0),B(0),  SubCarryIn,    Less, Invert, OpSel, CarryBits(0),  And_Out(0),  Or_Out(0),  Adder_Out(0));
	ALU1  : ALU port map (A(1),B(1),  CarryBits(0),  Less, Invert, OpSel, CarryBits(1),  And_Out(1),  Or_Out(1),  Adder_Out(1));
	ALU2  : ALU port map (A(2),B(2),  CarryBits(1),  Less, Invert, OpSel, CarryBits(2),  And_Out(2),  Or_Out(2),  Adder_Out(2));
	ALU3  : ALU port map (A(3),B(3),  CarryBits(2),  Less, Invert, OpSel, CarryBits(3),  And_Out(3),  Or_Out(3),  Adder_Out(3));
	ALU4  : ALU port map (A(4),B(4),  CarryBits(3),  Less, Invert, OpSel, CarryBits(4),  And_Out(4),  Or_Out(4),  Adder_Out(4));
	ALU5  : ALU port map (A(5),B(5),  CarryBits(4),  Less, Invert, OpSel, CarryBits(5),  And_Out(5),  Or_Out(5),  Adder_Out(5));
	ALU6  : ALU port map (A(6),B(6),  CarryBits(5),  Less, Invert, OpSel, CarryBits(6),  And_Out(6),  Or_Out(6),  Adder_Out(6));
	ALU7  : ALU port map (A(7),B(7),  CarryBits(6),  Less, Invert, OpSel, CarryBits(7),  And_Out(7),  Or_Out(7),  Adder_Out(7));
	ALU8  : ALU port map (A(8),B(8),  CarryBits(7),  Less, Invert, OpSel, CarryBits(8),  And_Out(8),  Or_Out(8),  Adder_Out(8));
	ALU9  : ALU port map (A(9),B(9),  CarryBits(8),  Less, Invert, OpSel, CarryBits(9),  And_Out(9),  Or_Out(9),  Adder_Out(9));
	ALU10 : ALU port map (A(10),B(10),CarryBits(9),  Less, Invert, OpSel, CarryBits(10), And_Out(10), Or_Out(10), Adder_Out(10));
	ALU11 : ALU port map (A(11),B(11),CarryBits(10), Less, Invert, OpSel, CarryBits(11), And_Out(11), Or_Out(11), Adder_Out(11));
	ALU12 : ALU port map (A(12),B(12),CarryBits(11), Less, Invert, OpSel, CarryBits(12), And_Out(12), Or_Out(12), Adder_Out(12));
	ALU13 : ALU port map (A(13),B(13),CarryBits(12), Less, Invert, OpSel, CarryBits(13), And_Out(13), Or_Out(13), Adder_Out(13));
	ALU14 : ALU port map (A(14),B(14),CarryBits(13), Less, Invert, OpSel, CarryBits(14), And_Out(14), Or_Out(14), Adder_Out(14));
	ALU15 : ALU port map (A(15),B(15),CarryBits(14), Less, Invert, OpSel, CarryBits(15), And_Out(15), Or_Out(15), Adder_Out(15));
	ALU16 : ALU port map (A(16),B(16),CarryBits(15), Less, Invert, OpSel, CarryBits(16), And_Out(16), Or_Out(16), Adder_Out(16));
	ALU17 : ALU port map (A(17),B(17),CarryBits(16), Less, Invert, OpSel, CarryBits(17), And_Out(17), Or_Out(17), Adder_Out(17));
	ALU18 : ALU port map (A(18),B(18),CarryBits(17), Less, Invert, OpSel, CarryBits(18), And_Out(18), Or_Out(18), Adder_Out(18));
	ALU19 : ALU port map (A(19),B(19),CarryBits(18), Less, Invert, OpSel, CarryBits(19), And_Out(19), Or_Out(19), Adder_Out(19));
	ALU20 : ALU port map (A(20),B(20),CarryBits(19), Less, Invert, OpSel, CarryBits(20), And_Out(20), Or_Out(20), Adder_Out(20));
	ALU21 : ALU port map (A(21),B(21),CarryBits(20), Less, Invert, OpSel, CarryBits(21), And_Out(21), Or_Out(21), Adder_Out(21));
	ALU22 : ALU port map (A(22),B(22),CarryBits(21), Less, Invert, OpSel, CarryBits(22), And_Out(22), Or_Out(22), Adder_Out(22));
	ALU23 : ALU port map (A(23),B(23),CarryBits(22), Less, Invert, OpSel, CarryBits(23), And_Out(23), Or_Out(23), Adder_Out(23));
	ALU24 : ALU port map (A(24),B(24),CarryBits(23), Less, Invert, OpSel, CarryBits(24), And_Out(24), Or_Out(24), Adder_Out(24));
	ALU25 : ALU port map (A(25),B(25),CarryBits(24), Less, Invert, OpSel, CarryBits(25), And_Out(25), Or_Out(25), Adder_Out(25));
	ALU26 : ALU port map (A(26),B(26),CarryBits(25), Less, Invert, OpSel, CarryBits(26), And_Out(26), Or_Out(26), Adder_Out(26));
	ALU27 : ALU port map (A(27),B(27),CarryBits(26), Less, Invert, OpSel, CarryBits(27), And_Out(27), Or_Out(27), Adder_Out(27));
	ALU28 : ALU port map (A(28),B(28),CarryBits(27), Less, Invert, OpSel, CarryBits(28), And_Out(28), Or_Out(28), Adder_Out(28));
	ALU29 : ALU port map (A(29),B(29),CarryBits(28), Less, Invert, OpSel, CarryBits(29), And_Out(29), Or_Out(29), Adder_Out(29));
	ALU30 : ALU port map (A(30),B(30),CarryBits(29), Less, Invert, OpSel, CarryBits(30), And_Out(30), Or_Out(30), Adder_Out(30));
	ALU31 : ALU port map (A(31),B(31),CarryBits(30), Less, Invert, OpSel, Cout,          And_Out(31), Or_Out(31), Adder_Out(31));
	--set is MSB of adder when adding
	SET <= Adder_Out(31);
	--calculating SLT output
	Slt_Out(31 downto 1) <= b"0000000000000000000000000000000";
	Slt_Out(0) <= Adder_Out(31);

	--picking output
	MUX1 : MUX4to1 port map (And_Out, Or_Out, Adder_Out, Slt_Out, OpSel, Output);
	
	--chacking if result is all 0's for zero/branching
	Zero <= '1' when ((A and B) or ((not A) and (not B))) = x"FFFFFFFF" else
			'0';
	
	--assign temp output to real result output
	Result <= Output;	

	
		

end structural;
	
	