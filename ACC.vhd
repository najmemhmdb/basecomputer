----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:29:52 05/20/2018 
-- Design Name: 
-- Module Name:    ACC - Behavioral 
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

entity ACC is
port(
       D_IN : in std_logic_vector(7 downto 0);
       D_OUT : out std_logic_vector(7 downto 0);
		 LE : in std_logic;
		 OE : in std_logic);
end ACC;

architecture Behavioral of ACC is
signal accregister : std_logic_vector(7 downto 0);
begin
process(D_IN , LE , OE)
begin
      if (LE='1')then 
			 accregister <= D_IN ;
      elsif(OE ='1')then 
           D_OUT <= accregister;	
		else 
		     D_OUT <= (others => 'Z');
     end if;			  
	end process ;

end Behavioral;

