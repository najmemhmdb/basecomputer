----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:21:28 05/20/2018 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
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
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.numeric_std.ALL;
entity RAM_Memory is
 Port (WR,RD,CS :in STD_LOGIC;
       dataIn:in STD_LOGIC_VECTOR(7 downto 0);
		 dataOut : out std_logic_vector(7 downto 0);
       Addr :in STD_LOGIC_VECTOR (4 downto 0)) ;
end RAM_Memory;

architecture Behavioral of RAM_Memory is
type Ram_type  is Array(31 downto 0)of STD_LOGIC_VECTOR(7 downto 0) ;
signal memory : 
Ram_type := (
					16 => "00000101",
					17 => "00000011",
					others => "00000000");
begin
process(CS,WR,RD,Addr)
begin
if(CS = '1')then
if(WR='1' )then
 case Addr is
		when "00000" => memory(0) <=dataIn;
		when "00001" => memory(1) <=dataIn;
		when "00010" => memory(2) <=dataIn;
		when "00011" => memory(3) <=dataIn;
		when "00100" => memory(4) <=dataIn;
		when "00101" => memory(5) <=dataIn;
		when "00110" => memory(6) <=dataIn;
		when "00111" => memory(7) <=dataIn;
		when "01000" => memory(8) <=dataIn;
		when "01001" => memory(9) <=dataIn;
		when "01010" => memory(10) <=dataIn;
		when "01011" => memory(11) <=dataIn;
		when "01100" => memory(12) <=dataIn;
		when "01101" => memory(13) <=dataIn;
		when "01110" => memory(14) <=dataIn;
		when "01111" => memory(15) <=dataIn;
		when "10000" => memory(16) <=dataIn;
		when "10001" => memory(17) <=dataIn;
		when "10010" => memory(18) <=dataIn;
		when "10011" => memory(19) <=dataIn;
		when "10100" => memory(20) <=dataIn;
		when "10101" => memory(21) <=dataIn;
		when "10110" => memory(22) <=dataIn;
		when "10111" => memory(23) <=dataIn;
		when "11000" => memory(24) <=dataIn;
		when "11001" => memory(25) <=dataIn;
		when "11010" => memory(26) <=dataIn;
		when "11011" => memory(27) <=dataIn;
		when "11100" => memory(28) <=dataIn;
		when "11101" => memory(29) <=dataIn;
		when "11110" => memory(30) <=dataIn;
		when "11111" => memory(31) <=dataIn;
		when others => memory(31) <=dataIn;
	end case;
elsif(RD = '1' )then
  case Addr is
		when "00000" => dataOut <= memory(0);
		when "00001" => dataOut <= memory(1);
		when "00010" => dataOut <= memory(2);
		when "00011" => dataOut <= memory(3);
		when "00100" => dataOut <= memory(4);
		when "00101" => dataOut <= memory(5);
		when "00110" => dataOut <= memory(6);
		when "00111" => dataOut <= memory(7);
		when "01000" => dataOut <= memory(8);
		when "01001" => dataOut <= memory(9);
		when "01010" => dataOut <= memory(10);
		when "01011" => dataOut <= memory(11);
		when "01100" => dataOut <= memory(12);
		when "01101" => dataOut <= memory(13);
		when "01110" => dataOut <= memory(14);
		when "01111" => dataOut <= memory(15);
		when "10000" => dataOut <= memory(16);
		when "10001" => dataOut <= memory(17);
		when "10010" => dataOut <= memory(18);
		when "10011" => dataOut <= memory(19);
		when "10100" => dataOut <= memory(20);
		when "10101" => dataOut <= memory(21);
		when "10110" => dataOut <= memory(22);
		when "10111" => dataOut <= memory(23);
		when "11000" => dataOut <= memory(24);
		when "11001" => dataOut <= memory(25);
		when "11010" => dataOut <= memory(26);
		when "11011" => dataOut <= memory(27);
		when "11100" => dataOut <= memory(28);
		when "11101" => dataOut <= memory(29);
		when "11110" => dataOut <= memory(30);
		when "11111" => dataOut <= memory(31);
		when others => dataOut<=(others=>'Z');
end case;
else 
 dataOut<=(others=>'Z');
end if;
else 
 dataOut<=(others=>'Z');
end if;
end process;

end Behavioral;
