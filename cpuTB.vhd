library ieee; use ieee.std_logic_1164.all; use ieee.numeric_std.all;
--Created By Ivan Contreras
entity cpuTB is 
end cpuTB;

--only signal we can control is the clock frequnecy
architecture behavior of cpuTB is
    component cpu is		
	port (
		clk : std_logic
	);
    end component;
			
    signal clk : std_logic := '0';
	constant clk_period : time := 100 ns;
begin	
    uut: entity work.cpu PORT MAP (  
	clk  => clk
    );
    stim : process	
    begin
		--will raise and lower clock based of period
		--changing period will change frequency
		clk <='0';
			wait for clk_period/2;
		clk <='1';
			wait for clk_period/2;

    end process;	
end behavior;
