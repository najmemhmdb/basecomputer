--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:10:46 06/07/2018
-- Design Name:   
-- Module Name:   C:/Users/1/Desktop/BC/DesignBasicComputer/tbrom.vhd
-- Project Name:  DesignBasicComputer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ROM_Memory
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbrom IS
END tbrom;
 
ARCHITECTURE behavior OF tbrom IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM_Memory
    PORT(
         CS : IN  std_logic;
         ROM_CLK : IN  std_logic;
         Addr : IN  std_logic_vector(4 downto 0);
         dataout : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CS : std_logic := '0';
   signal ROM_CLK : std_logic := '0';
   signal Addr : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal dataout : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant ROM_CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM_Memory PORT MAP (
          CS => CS,
          ROM_CLK => ROM_CLK,
          Addr => Addr,
          dataout => dataout
        );

   -- Clock process definitions
   ROM_CLK_process :process
   begin
		ROM_CLK <= '0';
		wait for ROM_CLK_period/2;
		ROM_CLK <= '1';
		wait for ROM_CLK_period/2;
   end process;
   process 
	begin
		CS <='1';
      Addr <= "00000";
	wait for 50 ns;
			CS <='0';
          Addr <= "00010";
	wait for 50 ns;
	   CS <='1';
      Addr <= "00001";
	wait for 50 ns;
	   CS <='0';
      Addr <= "00011";
	end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for ROM_CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
