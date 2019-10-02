----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:43:56 05/20/2018 
-- Design Name: 
-- Module Name:    AR - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AR is
port(
       D : in std_logic_vector(7 downto 0);
		 LE : in std_logic;
		 A : out std_logic_vector(4 downto 0));
end AR;

architecture Behavioral of AR is
begin
process(D , LE)
begin
      if (LE='1')then 
			A <=  D(4 downto 0) ;
       end if;			  
end process ;

end Behavioral;

