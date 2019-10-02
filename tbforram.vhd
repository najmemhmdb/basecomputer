--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:39:13 06/07/2018
-- Design Name:   
-- Module Name:   C:/Users/1/Desktop/BC/DesignBasicComputer/tbforram.vhd
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
 
ENTITY tbforram IS
END tbforram;
 
ARCHITECTURE behavior OF tbforram IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM_Memory
    PORT(
         WR : IN  std_logic;
         RD : IN  std_logic;
         CS : IN  std_logic;
         RAM_CLK : IN  std_logic;
         dataInOut : INOUT  std_logic_vector(7 downto 0);
         Addr : IN  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal WR : std_logic := '0';
   signal RD : std_logic := '0';
   signal CS : std_logic := '0';
   signal RAM_CLK : std_logic := '0';
   signal Addr : std_logic_vector(4 downto 0) := (others => '0');

	--BiDirs
   signal dataInOut : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant RAM_CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM_Memory PORT MAP (
          WR => WR,
          RD => RD,
          CS => CS,
          RAM_CLK => RAM_CLK,
          dataInOut => dataInOut,
          Addr => Addr
        );

   -- Clock process definitions
   RAM_CLK_process :process
   begin
		RAM_CLK <= '0';
		wait for RAM_CLK_period/2;
		RAM_CLK <= '1';
		wait for RAM_CLK_period/2;
   end process;
  process 
  begin 
		    WR <= '0';
          RD <= '1';
          CS <= '1';
          Addr <= "00000"; 
			 wait for 50 ns;
			 WR <= '0';
          RD <= '1';
          CS <= '0';
          Addr <= "00010"; 
			wait for 50 ns;
			 WR <= '0';
          RD <= '1';
          CS <= '1';
          Addr <= "00001"; 
			 wait for 50 ns;
			 WR <= '0';
          RD <= '1';
          CS <= '0';
          Addr <= "00010"; 
  end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for RAM_CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
