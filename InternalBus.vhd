----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:39:15 05/30/2018 
-- Design Name: 
-- Module Name:    InternalBus - Behavioral 
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

entity InternalBus is
port(
TEMP1,TEMP2,TEMP3 : in std_logic_vector(7 downto 0);
PC:inout std_logic_vector(4 downto 0);
AR : out std_logic_vector(4 downto 0);
DR,ACC,IR: inout std_logic_vector(7 downto 0)
);
end InternalBus;

architecture Behavioral of InternalBus is
signal InternalBus : std_logic_vector(7 downto 0);

begin


end Behavioral;

