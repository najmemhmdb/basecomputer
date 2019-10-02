----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:50:53 05/20/2018 
-- Design Name: 
-- Module Name:    DR - Behavioral 
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
-----------------------------------------------------------------------------------
entity DR is
port(
       DIN_IN : in std_logic_vector(7 downto 0);
       DIN_OUT : out std_logic_vector(7 downto 0);
		 DOUT_IN : in std_logic_vector(7 downto 0);
		 DOUT_OUT : out std_logic_vector(7 downto 0);
		 LE_in,LE_out : in std_logic;
		 OE_in,OE_out : in std_logic
		 );
end DR;

architecture Behavioral of DR is
signal DRregister : std_logic_vector(7 downto 0);
begin
process(DIN_IN,DOUT_IN, LE_in,LE_out,OE_in,OE_out)
begin
      if (LE_in='1' )then 
			 DRregister <= DIN_IN ;
	   elsif(OE_out ='1' )then 
		   DOUT_OUT <= DRregister;
      elsif(LE_out ='1')then
         DRregister <= DOUT_IN;
		elsif(OE_in ='1')then
			DIN_OUT <= DRregister;
		else 
			DIN_OUT <=(others=>'Z');
			DOUT_OUT <= (others => 'Z'); 
		end if;
end process ;

end Behavioral;

