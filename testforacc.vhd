--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:56:31 06/07/2018
-- Design Name:   
-- Module Name:   C:/Users/1/Desktop/BC/DesignBasicComputer/testforacc.vhd
-- Project Name:  DesignBasicComputer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ACC
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
 
ENTITY testforacc IS
END testforacc;
 
ARCHITECTURE behavior OF testforacc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ACC
    PORT(
         D_IN : IN  std_logic_vector(7 downto 0);
         D_OUT : OUT  std_logic_vector(7 downto 0);
         LE : IN  std_logic;
         OE : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D_IN : std_logic_vector(7 downto 0) := (others => '0');
   signal LE : std_logic := '0';
   signal OE : std_logic := '0';

 	--Outputs
   signal D_OUT : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ACC PORT MAP (
          D_IN => D_IN,
          D_OUT => D_OUT,
          LE => LE,
          OE => OE
        );

   process 
	begin
		D_IN <= "11110010";
		LE <= '1';
		OE <= '0';
		wait for 50 ns;
		LE <= '0';
		OE <= '1';
		wait for 50 ns;
		LE <= '0';
		OE<= '0';
		
	end process;
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
