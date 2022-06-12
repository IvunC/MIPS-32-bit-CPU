library ieee; use ieee.std_logic_1164.all;
--Created By Ivan Contreras
entity registerTB is		
end registerTB;

architecture behavior of registerTB is
	-- sending in the registerFile
    component registerFile is		
	port(
	    regWriteSig : in std_logic;
		readReg1, readReg2, writeReg : in std_logic_vector (4 downto 0);
		writeData : in std_logic_vector (31 downto 0);
		readData1, readData2 : out std_logic_vector (31 downto 0)
	);
    end component;
	--assigning all inputs to 0
    signal regWriteSig : std_logic := '0';	
    signal readReg1, readReg2, writeReg : std_logic_vector (4 downto 0) := "00000";
	signal writeData : std_logic_vector (31 downto 0) := x"00000000";
    signal readData1, readData2 : std_logic_vector (31 downto 0);

begin	
    uut: entity work.registerFile PORT MAP (	
	--connecting signals
	regWriteSig => regWriteSig, readReg1 => readReg1, readReg2 => readReg2,
	writeData => writeData, readData1 => readData1, readData2 => readData2,
    writeReg => writeReg 
	);
    stim : process	
	--writing and reading values to make sure the register stores values
    begin  				
		--writing	
    	writeData <= x"00001234";
		writeReg <= "00000";
		regWriteSig <= '1';
    		wait for 100 ns;
		regWriteSig <= '0';
		writeData <= x"00005678";
		writeReg <= "00001";
		regWriteSig <= '1';
			wait for 100 ns;
		regWriteSig <= '0';
		writeData <= x"12345678";
		writeReg <= "00010";
		regWriteSig <= '1';
			wait for 100 ns;
		--reading
		regWriteSig <= '0';
		readReg1 <= "00001";
		readReg2 <= "00010";
			wait for 100 ns;
    end process;	
end behavior;
