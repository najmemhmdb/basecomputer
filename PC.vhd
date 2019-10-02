----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:13:03 05/20/2018 
-- Design Name: 
-- Module Name:    PC - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
port(
       D_IN : in std_logic_vector(7 downto 0);
		 D_OUT : out std_logic_vector(7 downto 0);
		 clk : in std_logic;
		 LE : in std_logic;
		 OE : in std_logic;
		 CLR : in std_logic;
		 INC : in std_logic);
end PC;

architecture Behavioral of PC is
signal PCregister : std_logic_vector(7 downto 0);
begin
D_OUT <= PCregister when OE = '1' else ((others => 'Z' ));
process(clk)
begin
	if(clk'event and clk='1')then 
      if(LE = '1' )then 
			PCregister<= D_IN;		
		elsif(CLR = '1')then
		   PCregister<= "00000000";
		elsif(INC = '1')then
		   PCregister <= PCregister + "00000001" ;
	end if;
end if;
end process ;
end Behavioral;

