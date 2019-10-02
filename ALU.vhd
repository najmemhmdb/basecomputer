----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:09:15 05/27/2018 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
port(
temp1,temp2 : in std_logic_vector(7 downto 0);
C : in std_logic_vector(1 downto 0);
CF : out std_logic;
temp3 : out std_logic_vector(7 downto 0));

end ALU;

architecture Behavioral of ALU is

begin
process(C,temp1,temp2)
	begin
		case C is 
		   when "00" =>
		
					temp3 <= temp1 and temp2;
			
		   when "01" =>
		
					temp3 <= temp1 + temp2;
					CF <= temp1(7) xor temp2(7);
			when "10" => 
		
					temp3 <= not temp1;
		
		    when "11" => 
					temp3(6 downto 0)<= temp1(7 downto 1);
					temp3(7)<= '0';
			when others => 
				    temp3 <= ((others => 'Z' ));	
		end case;
			
end process; 

end Behavioral;

