--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:02:22 06/09/2018
-- Design Name:   
-- Module Name:   F:/BC_edited/BC_edited/alutb.vhd
-- Project Name:  DesignBasicComputer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY alutb IS
END alutb;
 
ARCHITECTURE behavior OF alutb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         temp1 : IN  std_logic_vector(7 downto 0);
         temp2 : IN  std_logic_vector(7 downto 0);
         C : IN  std_logic_vector(1 downto 0);
         CF : OUT  std_logic;
         temp3 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal temp1 : std_logic_vector(7 downto 0) := (others => '0');
   signal temp2 : std_logic_vector(7 downto 0) := (others => '0');
   signal C : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal CF : std_logic;
   signal temp3 : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          temp1 => temp1,
          temp2 => temp2,
          C => C,
          CF => CF,
          temp3 => temp3
        );

   process 
	begin 
	temp1 <= "00000101";
	temp2 <= "00000011";
	C <= "01";
	wait for 50 ns;
	temp1 <= "ZZZZZZZZ";
	temp2 <= "ZZZZZZZZ";
	C <= "ZZ";
	wait for 50 ns;
	temp1 <= "ZZZZZZZZ";
	temp2 <= "ZZZZZZZZ";
	C <= "ZZ";
	
	end process;

END;
