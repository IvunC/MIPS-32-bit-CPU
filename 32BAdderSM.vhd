library ieee; use ieee.std_logic_1164.all;

entity adder32Bits is
    port (    
	A,B : in std_logic_vector (31 downto 0);	
	Cin : in std_logic;
	S : out std_logic_vector (31 downto 0);
	Cout : out std_logic	
    );
end adder32Bits;

architecture behavioral of adder32Bits is 
	
    signal P, G: std_logic_vector (31 downto 0);
    signal C: std_logic_vector (32 downto 0);
    	
    begin	

	P <= A xor B;
	G <= A and B;
	
	process (P, G, C, Cin)
	    begin
	    C(0) <= Cin; 
	    for i in 0 to 31 loop 
	        C(i+1) <= G(i) or (P(i) and C(i));
	    end loop;
	end process;
	--S = A xor B xor C
	S <= C(31 downto 0) xor P;
	
	Cout <= C(32);
end behavioral;
