----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:04:43 05/20/2018 
-- Design Name: 
-- Module Name:    IR - Behavioral 
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

entity IR is
port(
       D_IN : in std_logic_vector(7 downto 0);
       D_OUT: out std_logic_vector(7 downto 0);
		 LE : in std_logic;
		 OE : in std_logic;
		 I : out std_logic_vector(2 downto 0)
		 );
end IR;

architecture Behavioral of IR is
signal IRregister : std_logic_vector(7 downto 0);
begin
process(D_IN,LE,OE)
begin
      if (LE ='1')then 
		  IRregister<=D_IN;
		  I <= D_IN(7 downto 5);
		 
		elsif(OE ='1')then 
		   D_OUT <= IRregister;
		else
			D_OUT<=(others=>'Z');
		end if;
end process ;

end Behavioral;

