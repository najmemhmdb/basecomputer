----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:10:42 05/20/2018 
-- Design Name: 
-- Module Name:    ROM - Behavioral 
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
entity ROM_Memory is
 Port (CS : in STD_LOGIC;
       Addr :in STD_LOGIC_VECTOR (4 downto 0) ; 
       dataout :out STD_LOGIC_VECTOR(7 downto 0));
end ROM_Memory;

architecture Behavioral of ROM_Memory is
type Rom_type  is Array( 31 downto 0)of STD_LOGIC_VECTOR(7 downto 0) ;
constant memory :
 Rom_type := (
					0 => "00010000",
					1 => "10110001",
					2 => "11100000",
					3 => "00111101",
					4 => "00010000",
					others => "00000000");
											
begin
process(CS,Addr)
begin
if(CS='1')then 
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
	when others => dataOut <= (others => 'Z');
end case;
else dataout<=(others=>'Z');
end if;
end process;
end Behavioral;

