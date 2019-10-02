--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:11:23 06/04/2018
-- Design Name:   
-- Module Name:   C:/Users/1/Desktop/DesignBasicComputer_edited/DesignBasicComputer/tb.vhd
-- Project Name:  DesignBasicComputer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TopModule
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
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TopModule
    PORT(
         clk2 : IN  std_logic;
         reset2 : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk2 : std_logic := '0';
   signal reset2 : std_logic := '0';

   -- Clock period definitions
   constant clk2_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TopModule PORT MAP (
          clk2 => clk2,
          reset2 => reset2
        );
		  reset2 <= '1' ,'0' after 20 ns;
   -- Clock process definitions
   clk2_process :process
   begin
		clk2 <= '0';
		wait for clk2_period/2;
		clk2 <= '1';
		wait for clk2_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk2_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
