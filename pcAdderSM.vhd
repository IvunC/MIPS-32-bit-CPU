library ieee; use ieee.std_logic_1164.all;
--Created By Ivan Contreras
--using CLA for pc adder
entity pcAdder is
    port (    --32 bit inputs and outputs, one Cin, one Cout
	A : in std_logic_vector (31 downto 0);	
	Cin : in std_logic;
	S : out std_logic_vector (31 downto 0)
    );
end pcAdder;

--same from lab 2 extra credit
architecture behavioral of pcAdder is 
	
    signal P, G: std_logic_vector (31 downto 0);
    signal C: std_logic_vector (32 downto 0);
    signal B: std_logic_vector (31 downto 0);

    begin	

	--hard coded B to be 4
	--newPC = inputPC + 4
	B <= x"00000004";
	P <= A xor B;
	G <= A and B;
	
	process (A,P, G, C, Cin)
	    begin
	    C(0) <= Cin;
	    for i in 0 to 31 loop --iterate 32 times
		
	        C(i+1) <= G(i) or (P(i) and C(i));
	    end loop;
	end process;
	
	S <= C(31 downto 0) xor P;
	
end behavioral;
