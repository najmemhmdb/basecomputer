----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:18:52 05/31/2018 
-- Design Name: 
-- Module Name:    TopModule - Behavioral 
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

entity TopModule is
port(
clk2 : in std_logic;
reset2 : in std_logic ;
ioout2: out std_logic_vector(7 downto 0)
);
end TopModule;

architecture Behavioral of TopModule is
component CPU is
port(
CLK1 ,RST1 : in std_logic;
WR1 , RD1 : out std_logic;
AddressBus : out std_logic_vector(4 downto 0);
DataBus : inout std_logic_vector(7 downto 0);
ROMCS,RAMCS : out std_logic;
io_cs1 : out std_logic
);
end component ;
component io is 
port(
dataIn: in std_logic_vector(7 downto 0);
cs: in std_logic;
dataOut : out std_logic_vector(7 downto 0)
);
end component;

component ROM_Memory is
port(CS : in STD_LOGIC;
       Addr :in STD_LOGIC_VECTOR (4 downto 0) ; 
       dataout :out STD_LOGIC_VECTOR(7 downto 0));
end component ;


component RAM_Memory is
port( WR,RD,CS :in STD_LOGIC;
       dataIn:in STD_LOGIC_VECTOR(7 downto 0);
		 dataOut : out std_logic_vector(7 downto 0);
       Addr :in STD_LOGIC_VECTOR (4 downto 0)) ;

end component ;



component Decoder is
port(
addressRange : in STD_LOGIC_VECTOR(4 downto 0);
RAM_CS ,ROM_CS : in std_logic;
chip_select_rom : out STD_LOGIC; 
chip_select_ram : out std_logic;
chip_select_io0 : out std_logic 
);
end component ;
signal signal_dataBus : std_logic_vector(7 downto 0);
signal  signal_address : std_logic_vector(4 downto 0);
signal  signal_chip_select_rom ,signal_chip_select_ram ,signal_chip_select_io0
, signal_WR , signal_RD  ,ROMCS_CPU,RAMCS_CPU , signal_cs ,s_cs: std_logic;
begin 


cpu_ins : CPU port map (CLK1 => clk2 ,  RST1 => reset2  , WR1 => signal_WR , RD1 => signal_RD ,AddressBus => 
signal_address,DataBus => signal_dataBus , ROMCS =>ROMCS_CPU,RAMCS => RAMCS_CPU  , io_cs1 => signal_cs);


ram_ins : RAM_Memory port map( WR => signal_WR , RD => signal_RD ,CS => signal_chip_select_ram,dataIn
 => signal_dataBus,dataOut => signal_dataBus , Addr => signal_address);


rom_ins : ROM_Memory port map (CS => signal_chip_select_rom ,
 Addr => signal_address , dataout => signal_dataBus);
 
 
decoder_ins : Decoder port map(addressRange => signal_address,RAM_CS => RAMCS_CPU,ROM_CS => ROMCS_CPU , 
chip_select_rom => signal_chip_select_rom , chip_select_ram => signal_chip_select_ram , 
chip_select_io0 => signal_chip_select_io0 );

s_cs <= signal_cs and signal_chip_select_io0 ;

io_ins : io port map (dataIn => signal_dataBus , cs => s_cs, dataOut => ioout2 );

end Behavioral;

