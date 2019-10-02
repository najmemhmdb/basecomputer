----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:43:04 05/30/2018 
-- Design Name: 
-- Module Name:    temp - Behavioral 
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
-----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity temp is
port(dataIn: in std_logic_vector(7 downto 0);
dataOut : out std_logic_vector(7 downto 0);
LE,OE : in std_logic);
end temp;

architecture Behavioral of temp is
signal tempRegister : std_logic_vector(7 downto 0);
begin
process(LE,OE,dataIn)
	begin
	if(LE = '1') then
		tempRegister <= dataIn;
	end if;
	if(OE = '1') then
		dataOut <= tempRegister;
		else
		dataOut <= (others => 'Z');
	end if;
	end process;
end Behavioral;

