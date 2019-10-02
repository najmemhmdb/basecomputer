----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:31:50 05/20/2018 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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

entity Decoder is
port(
addressRange : in STD_LOGIC_VECTOR(4 downto 0);
RAM_CS ,ROM_CS : in std_logic;
chip_select_rom : out STD_LOGIC; 
chip_select_ram : out std_logic;
chip_select_io0 : out std_logic
);
end Decoder;


architecture Behavioral of Decoder is
begin
	process(addressRange)
		begin
			if(addressRange(4)='0') then
			chip_select_rom <= '1';
			chip_select_ram <= '0';
			chip_select_io0 <= '0';
		elsif(addressRange(4)='1') then
			if(addressRange(3 downto 0)<="0111") then
				chip_select_rom <= '0';
				chip_select_ram <= '1';
				chip_select_io0 <= '0';
			elsif(addressRange(3 downto 0)="1101") then
				chip_select_rom <= '0';
				chip_select_ram <= '0';
				chip_select_io0 <= '1';
			
			end if;
		end if;
	end process;
end Behavioral;



