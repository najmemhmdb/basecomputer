--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:05:08 06/09/2018
-- Design Name:   
-- Module Name:   F:/BC_edited/BC_edited/tr.vhd
-- Project Name:  DesignBasicComputer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM_Memory
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
 
ENTITY tr IS
END tr;
 
ARCHITECTURE behavior OF tr IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM_Memory
    PORT(
         WR : IN  std_logic;
         RD : IN  std_logic;
         CS : IN  std_logic;
         dataIn : IN  std_logic_vector(7 downto 0);
         dataOut : OUT  std_logic_vector(7 downto 0);
         Addr : IN  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal WR : std_logic := '0';
   signal RD : std_logic := '0';
   signal CS : std_logic := '0';
   signal dataIn : std_logic_vector(7 downto 0) := (others => '0');
   signal Addr : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal dataOut : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM_Memory PORT MAP (
          WR => WR,
          RD => RD,
          CS => CS,
          dataIn => dataIn,
          dataOut => dataOut,
          Addr => Addr
        );
		  
		  
		  process 
		  begin
			WR <= '0';
			RD <= '1';
			CS <= '1';
			Addr<="10000";
		  wait for 50 ns ;
		   Addr <= "10001";
		  wait for 50 ns;
		  Addr <= "00000";
		  end process;

   -- Clock process definitions
 
 

   -- Stimulus process
END;
