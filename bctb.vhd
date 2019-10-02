--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   06:26:41 06/17/2018
-- Design Name:   
-- Module Name:   C:/Users/1/Desktop/emtiazi/BC_edited/BC_edited/bctb.vhd
-- Project Name:  DesignBasicComputer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BC
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
 
ENTITY bctb IS
END bctb;
 
ARCHITECTURE behavior OF bctb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BC
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         instruction : IN  std_logic_vector(7 downto 0);
         output : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal instruction : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BC PORT MAP (
          clk => clk,
          rst => rst,
          instruction => instruction,
          output => output
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
   program :	process  
	begin 
		rst <= '1';
		instruction <= "00000000";
		wait for 100 ns;
		rst <= '0';
		instruction <= "00010000";
		wait for 100 ns ;
		instruction <= "10110001" ;
		wait for 100 ns;
		instruction <= "11100000";
	end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
