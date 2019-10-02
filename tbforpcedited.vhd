--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:24:20 06/07/2018
-- Design Name:   
-- Module Name:   C:/Users/1/Desktop/BC/DesignBasicComputer/tbforpcedited.vhd
-- Project Name:  DesignBasicComputer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PC
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
 
ENTITY tbforpcedited IS
END tbforpcedited;
 
ARCHITECTURE behavior OF tbforpcedited IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         D_IN : IN  std_logic_vector(7 downto 0);
         D_OUT : OUT  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         LE : IN  std_logic;
         OE : IN  std_logic;
         CLR : IN  std_logic;
         INC : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D_IN : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal LE : std_logic := '0';
   signal OE : std_logic := '0';
   signal CLR : std_logic := '0';
   signal INC : std_logic := '0';

 	--Outputs
   signal D_OUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          D_IN => D_IN,
          D_OUT => D_OUT,
          clk => clk,
          LE => LE,
          OE => OE,
          CLR => CLR,
          INC => INC
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	simulation_process : process
	begin 
	D_IN <= "11110011";
	LE <= '1';
	OE <= '0';
	CLR <= '0';
	INC <= '0';
	wait for 50 ns ;
	OE<='1';
	LE <= '0';
	wait for 50 ns ;
	OE<='0';
	CLR <= '1';
	wait for 50 ns ;
	OE<='1';
	CLR <= '0';
	LE <= '0';
	INC <= '0';
	wait for 50 ns ;
	D_IN <= "10101010";
	LE <= '1';
	OE <= '0';
	CLR <= '0';
	INC <= '0';
	wait for 50 ns ;
	OE<='1';
	LE <= '0';
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
