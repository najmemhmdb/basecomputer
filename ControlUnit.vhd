----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:33:49 05/30/2018 
-- Design Name: 
-- Module Name:    CU - Behavioral 
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

entity ControlUnit is
port(
CF : in std_logic;
D : in std_logic_vector(7 downto 0);
I  : in std_logic_vector(2 downto 0);
CLK,RST : in std_logic;
ER,RD : out std_logic;
AC_LE,AC_OE,AR_LE,DR_LE_IN,DR_LE_OUT,DR_OE_IN,DR_OE_OUT,IR_LE,IR_OE,PC_LE,PC_OE,PC_CLR,PC_INC,ROM_CS,ALU_C, 
TEMP1_LE , TEMP1_OE,TEMP2_LE , TEMP2_OE: out std_logic
);
end ControlUnit;

architecture Behavioral of ControlUnit is
type state is (fetch1,fetch2,decode,load,store,nott,andd,add,shift,jump,jumpc);
signal state, next_state : state:=fetch1 ; 
begin
	process(state) 
		begin
		case state is
			when fetch1 =>
				PC_OE <= '1';
				AR_LE <= '1';
				ROM_CS <= '1';
				DR_LE_IN <= '1';
				next_state <= fetch2 ;
			when fetch2 =>
			   PC_OE <= '0';
				AR_LE <= '0';
				ROM_CS <= '0';
				DR_LE_IN <= '0';
				IR_LE <='1';
				DR_OE_OUT <='1';
				PC_INC <= '1' ;
				next_state <= decode;
			when decode =>
			   IR_LE <='0';
				DR_OE_OUT <='0';
				PC_INC <= '0';
				IR_OE <= '1';
				case I is 
					when "000" =>
						next_state <= load;
					when "001" =>
						 next_state <= store;
					when "010" =>
						next_state <= jump;
					when "011" => 
						 next_state <= jumpc;
					when "100" =>
						next_state <= andd;
					when "101" => 
						 next_state <= add;
					when "110" =>
						next_state <= nott;
					when "111" => 
						 next_state <= shift;
				end case;
			when load =>
				
			when store =>
				IR_OE <= '0';
			when jump =>
				IR_OE <= '0';
				PC_LE <= '1' ;
				next_state <=final;
			when jumpc =>
				IR_OE <= '0';
				if(CF = '1')then
					PC_LE <= '1' ;
					next_state <= final;
				else
					next_state <= final;
				end if;
			when andd =>
				IR_OE <= '0';
				AC_OE<='1';
				TEMP1_LE <='1';
				next_state <=andd2;
			when andd2 =>
				DR_OE_OUT <= '1';
				TEMP2_C <= '1';
				ALU_C <= "00";
            next_state <= final;
			when add =>
				IR_OE <= '0';
				AC_OE<='1';
				TEMP1_LE <='1';
				next_state <=add2;
			when add2 =>
				DR_OE_OUT <= '1';
				TEMP2_C <= '1';
				ALU_C <= "01";
				next_state <= final;
			when nott =>
				IR_OE <= '0';
				AC_OE<='1';
				TEMP1_LE <='1';
				next_state<=nott2;
			when nott2 =>
			   DR_OE_OUT <= '1';
				TEMP2_C <= '1';
				ALU_C <= "10";
				next_state <=final;
			when shift =>
				IR_OE <= '0';
				AC_OE<='1';
				TEMP1_LE <='1';
				next_state <=shift2;
			when shift2 =>
			   DR_OE_OUT <= '1';
				TEMP2_C <= '1';
				ALU_C <= "11";
				next_state <=final;
			when final =>
				AC_LE<='0';
				AC_OE<= '0';
				AR_LE<='0';
				DR_LE_IN<='0';
				DR_LE_OUT<='0';
				DR_OE_IN<='0';
				DR_OE_OUT<='0';
				IR_LE<='0';
				IR_OE<='0';
				PC_LE <='0';
				PC_OE <= '0';
				PC_CLR <= '0';
				PC_INC <= '0';
				ROM_CS <= '0';
				ALU_C <= '0'; 
				TEMP1_LE <='0';
				TEMP1_OE <= '0';
				TEMP2_LE <= '0';
				TEMP2_OE <= '0';
		end case;
	end process;
end Behavioral;

