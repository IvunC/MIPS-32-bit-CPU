library ieee; use ieee.std_logic_1164.all;

entity oneBAdderTB is		--entity name, nothing inside as its testbench
end oneBAdderTB;

architecture behavior of oneBAdderTB is
    component RCA is		--pass in 1-bit RCA  and its inputs
	port(
	    A : in std_logic;
	    B : in std_logic;
	    Cin : in std_logic;
	    S : out std_logic;
	    Cout : out std_logic
	);
    end component;

    signal A : std_logic := '1';	--initialize inputs as value '1'
    signal B : std_logic := '1';
    signal Cin : std_logic := '1';
    signal S : std_logic;
    signal Cout : std_logic;

begin	
    uut: entity work.RCA PORT MAP (	--connect RCA ports to testbench ports
	A => A,	
	B => B,
	Cin => Cin,
	S => S,
	Cout => Cout
    );
    stim : process	--test process
    begin  				--testing every case for inputs and then waiting 100ns inbetweenS
    A <= '1'; B <= '1'; Cin <= '1';
   	wait for 100 ns;
    A <= '1'; B <= '1'; Cin <= '0';   
	wait for 100 ns;
    A <= '1'; B <= '0'; Cin <= '1'; 
	wait for 100 ns;
    A <= '1'; B <= '0'; Cin <= '0'; 
	wait for 100 ns;
    A <= '0'; B <= '1'; Cin <= '1'; 
	wait for 100 ns;
    A <= '0'; B <= '1'; Cin <= '0'; 
	wait for 100 ns;
    A <= '0'; B <= '0'; Cin <= '1'; 
	wait for 100 ns;
    A <= '0'; B <= '0'; Cin <= '0'; 
	wait for 100 ns;
    
    end process;	--end test process and behavior of testbench
end behavior;
