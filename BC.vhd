----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:46:29 06/17/2018 
-- Design Name: 
-- Module Name:    BC - Behavioral 
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

entity BC is
port(
clk ,rst : in std_logic;
instruction : in std_logic_vector (7 downto 0);
output : out std_logic_vector(7 downto 0)
);
end BC;

architecture Behavioral of BC is
signal pc,ar,acc,ir,temp,temp1 : std_logic_vector (7 downto 0);
signal cf : std_logic;
type Ram_type  is Array(31 downto 0)of STD_LOGIC_VECTOR(7 downto 0) ;
signal mem : 
Ram_type := (
					16 => "00000101",
					17 => "00000011",
					others => "00000000");
begin
process (clk , rst , instruction)
begin
if(rst = '1' )then
	output <= (others => 'Z');
	pc <= "00000000";
	ar <= "00000000";
	acc <= "00000000";
	ir <= "00000000";
	temp <= "00000000";
else 
	
	case instruction(7 downto 5) is
		when "000" =>
			acc <= mem(16);
			output <= acc;
		when "001" =>
			mem(0) <= acc;
			output <= acc;
		when "010" =>
			pc <= ir(4 downto 0);
			output <= acc;
		when "011" => 
			if(cf = '1')then
				pc <= ir(4 downto 0);
			end if;
			output <= acc;
		when "100" =>
			temp <= acc and mem(0);
			acc <= temp;
			output <= temp ; 
		when "101" =>
			temp1 <= mem(17);
			temp <= acc + temp1;
			acc <= temp;
			output <= temp;
		when "110" =>
			temp <= not acc;
			acc <= temp;
			output <= temp;
		when "111" =>
			temp(6 downto 0)<= acc(7 downto 1);
			temp(7)<= '0';
			acc <= temp;
			output <= temp;
		
	end case;
end if;
end process;

end Behavioral;

