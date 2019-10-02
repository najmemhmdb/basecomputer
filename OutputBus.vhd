----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:57:11 05/20/2018 
-- Design Name: 
-- Module Name:    OutputBus - Behavioral 
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

entity dataBus is
port(
   dataInOut : inout std_logic_vector(7 downto 0);
	CS1,WR,CS2,RD,CS3,WRIO,RDIO : in std_logic;
	dataout : out std_logic_vector(7 downto 0);
	dataIn : in std_logic_vector(7 downto 0);
	dataInOut2 : inout std_logic_vector(7 downto 0 ));
end dataBus;

architecture Behavioral of dataBus is

begin
process ( dataInOut,CS1,WR,CS2,RD,CS3,WRIO,RDIO,dataIn,dataInOut2)
begin 
if(CS1 ='1' and WR = '1' )then
dataout <= dataInOut ;
end if;
if (CS2 ='1' and RD ='1' )then
dataInOut <= dataIn;
end if;
if(CS3 ='1')then
	 if (WRIO='1')then 
	     dataInOut2 <= dataInOut;
	 elsif(RDIO ='1' )then
		     dataInOut <= dataInOut2;
	 end if;
end if;
end process; 

end Behavioral;

