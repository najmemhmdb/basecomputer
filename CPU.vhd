----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:48:43 05/30/2018 
-- Design Name: 
-- Module Name:    CPU - Behavioral 
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

entity CPU is
port(
CLK1 ,RST1 : in std_logic;
WR1 , RD1 : out std_logic;
AddressBus : out std_logic_vector(4 downto 0);
DataBus : inout std_logic_vector(7 downto 0);
ROMCS,RAMCS : out std_logic;
io_cs1 : out std_logic
);
end CPU;

architecture Behavioral of CPU is
component ACC is
port(
		 D_IN : in std_logic_vector(7 downto 0);
       D_OUT : out std_logic_vector(7 downto 0);
		 LE : in std_logic;
		 OE : in std_logic);
end component ;
component ALU is
port(
temp1,temp2 : in std_logic_vector(7 downto 0);
C : in std_logic_vector(1 downto 0);
CF : out std_logic;
temp3 : out std_logic_vector(7 downto 0));
end component ;
component AR is
port(
       D : in std_logic_vector(7 downto 0);
		 LE : in std_logic;
		 A : out std_logic_vector(4 downto 0)); 
end component ;
component DR is
port(
        DIN_IN : in std_logic_vector(7 downto 0);
       DIN_OUT : out std_logic_vector(7 downto 0);
		 DOUT_IN : in std_logic_vector(7 downto 0);
		 DOUT_OUT : out std_logic_vector(7 downto 0);
		 LE_in,LE_out : in std_logic;
		 OE_in,OE_out : in std_logic
		 );
end component ;
component IR is
port( D_IN : in std_logic_vector(7 downto 0);
       D_OUT: out std_logic_vector(7 downto 0);
		 LE : in std_logic;
		 OE : in std_logic;
		 I : out std_logic_vector(2 downto 0)
		 );
end component ;

component PC is
port( D_IN : in std_logic_vector(7 downto 0);
		 D_OUT : out std_logic_vector(7 downto 0);
		 clk : in std_logic;
		 LE : in std_logic;
		 OE : in std_logic;
		 CLR : in std_logic;
		 INC : in std_logic);
end component ;

component ControlUnit is
	port(
CF : in std_logic;
I  : in std_logic_vector(2 downto 0);
CLK,RST : in std_logic;
WR : out std_logic;
RD : out std_logic;
AC_LE,AC_OE,AR_LE,DR_LE_IN,DR_LE_OUT,DR_OE_IN,DR_OE_OUT,IR_LE,IR_OE,PC_LE,PC_OE,PC_CLR,PC_INC,ROM_CS,RAM_CS, 
TEMP1_LE , TEMP1_OE,TEMP2_LE , TEMP2_OE,TEMP3_LE,TEMP3_OE,io_cs: out std_logic;
ALU_C : out std_logic_vector(1 downto 0)
);
end component ;

component temp is
port(dataIn: in std_logic_vector(7 downto 0);
dataOut : out std_logic_vector(7 downto 0);
LE,OE : in std_logic);
end component ;
signal tempCF , signal_AC_LE,signal_AC_OE ,signal_AR_LE ,signal_DR_LE_IN,signal_DR_LE_OUT ,signal_DR_OE_IN ,
signal_DR_OE_OUT ,signal_IR_LE,signal_IR_OE,signal_PC_LE ,signal_PC_OE ,signal_PC_CLR ,signal_PC_INC,
signal_ROM_CS,signal_RAM_CS,signal_TEMP1_LE,signal_TEMP1_OE,signal_TEMP2_LE, signal_TEMP2_OE,signal_TEMP3_LE,
signal_TEMP3_OE : std_logic;
signal tempI : std_logic_vector(2 downto 0);
signal signal_ALU_C :std_logic_vector(1 downto 0);
signal dataOutTemp1,dataOutTemp2,dataOutTemp3 , dataOnInternalBus : std_logic_vector(7 downto 0);
begin
cu : ControlUnit  port map( CF =>tempCF  ,I => tempI  , CLK => CLK1 , RST => RST1 ,  WR => WR1 , RD => RD1,
AC_LE => signal_AC_LE  ,AC_OE=>signal_AC_OE ,AR_LE=>signal_AR_LE ,DR_LE_IN=>signal_DR_LE_IN ,DR_LE_OUT=>
signal_DR_LE_OUT,DR_OE_IN => signal_DR_OE_IN,DR_OE_OUT=>signal_DR_OE_OUT,IR_LE=>signal_IR_LE ,IR_OE =>
signal_IR_OE,PC_LE => signal_PC_LE,PC_OE => signal_PC_OE ,PC_CLR => signal_PC_CLR ,PC_INC => signal_PC_INC 
,ROM_CS =>ROMCS,RAM_CS =>RAMCS , TEMP1_LE => signal_TEMP1_LE ,TEMP1_OE => signal_TEMP1_OE 
,TEMP2_LE =>signal_TEMP2_LE,TEMP2_OE => signal_TEMP2_OE,TEMP3_LE =>signal_TEMP3_LE,TEMP3_OE => signal_TEMP3_OE
,io_cs => io_cs1, ALU_C => signal_ALU_C);


--acc_ins : ACC port map(D => dataOnInternalBus,LE => signal_AC_LE ,OE => signal_AC_OE);
acc_ins : ACC port map(D_IN => dataOnInternalBus,D_OUT => dataOnInternalBus,
LE => signal_AC_LE ,OE => signal_AC_OE);

ar_ins : AR port map(D => dataOnInternalBus ,LE => signal_AR_LE,A=> AddressBus);


--dr_ins : DR port map(DIN => DataBus,DOUT => dataOnInternalBus ,LE_IN => signal_DR_LE_IN ,LE_OUT => 
--signal_DR_LE_OUT,OE_IN => signal_DR_OE_IN ,OE_OUT => signal_DR_OE_OUT);
dr_ins : DR port map(DIN_IN => DataBus,DIN_OUT => DataBus,DOUT_IN => dataOnInternalBus,DOUT_OUT =>
dataOnInternalBus ,LE_IN => signal_DR_LE_IN ,LE_OUT => 
signal_DR_LE_OUT,OE_IN => signal_DR_OE_IN ,OE_OUT => signal_DR_OE_OUT);


--ir_ins : IR port map(D => dataOnInternalBus,LE => signal_IR_LE ,OE => signal_IR_OE ,I => tempI );
ir_ins : IR port map(D_IN => dataOnInternalBus,D_OUT => dataOnInternalBus,LE => signal_IR_LE ,OE =>
signal_IR_OE ,I => tempI );


--pc_ins : PC port map(D => dataOnInternalBus ,clk => CLK1 ,LE => signal_PC_LE ,OE => signal_PC_OE ,CLR =>
--signal_PC_CLR ,INC => signal_PC_INC);

pc_ins : PC port map (D_IN => dataOnInternalBus , D_OUT => dataOnInternalBus,clk => CLK1 ,LE => 
signal_PC_LE ,OE => signal_PC_OE ,CLR =>signal_PC_CLR ,INC => signal_PC_INC);

temp1_ins : temp port map(dataIn => dataOnInternalBus ,dataOut => dataOutTemp1 ,LE => signal_TEMP1_LE ,OE => 
signal_TEMP1_OE);


temp2_ins : temp port map(dataIn => dataOnInternalBus ,dataOut => dataOutTemp2 ,LE => signal_TEMP2_LE ,OE =>
signal_TEMP2_OE);


temp3_ins : temp port map(dataIn => dataOutTemp3 ,dataOut => dataOnInternalBus,LE => signal_TEMP3_LE ,OE =>
signal_TEMP3_OE);


alu_ins : ALU port map(temp1 => dataOutTemp1 ,temp2 => dataOutTemp2,C => signal_ALU_C ,CF => tempCF
 ,temp3 => dataOutTemp3);
end Behavioral;

