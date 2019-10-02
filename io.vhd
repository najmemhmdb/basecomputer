----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:34:28 06/15/2018 
-- Design Name: 
-- Module Name:    io - Behavioral 
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

entity io is
port(
dataIn: in std_logic_vector(7 downto 0);
cs: in std_logic;
dataOut : out std_logic_vector(7 downto 0)
);
end io;

architecture Behavioral of io is
signal dataregister : std_logic_vector(7 downto 0);
begin
process(cs,dataIn)
begin 
if(cs = '1') then
dataregister <= dataIn ;
end if;
end process;
dataOut <= dataregister;
end Behavioral;

