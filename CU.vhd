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
I  : in std_logic_vector(2 downto 0);
CLK,RST : in std_logic;
WR : out std_logic;
RD : out std_logic;
AC_LE,AC_OE,AR_LE,DR_LE_IN,DR_LE_OUT,DR_OE_IN,DR_OE_OUT,IR_LE,IR_OE,PC_LE,PC_OE,PC_CLR,PC_INC,ROM_CS,RAM_CS, 
TEMP1_LE , TEMP1_OE,TEMP2_LE , TEMP2_OE,TEMP3_LE,TEMP3_OE,io_cs : out std_logic;
ALU_C : out std_logic_vector(1 downto 0)
);
end ControlUnit;

architecture Behavioral of ControlUnit is
type state_t is (initial , reset,fetch1,fetch2,decode,load,store,nott,andd,add,shift,jump,jumpc,andd2,andd3,andd4,andd5
,add2,add3,add4,add5,nott2,nott3,shift2,shift3,load2,store2);
signal state : state_t := initial;
signal next_state :state_t := initial ; 
begin
process (CLK)
	begin
		if(rising_edge(CLK))then
			state <= next_state;
		end if;
	end process;
	process(state,RST) 
		begin
		--if(rising_edge(CLK))then 
		--	state <= next_state ;
			case state is
			  when initial =>
					PC_OE <= '0';
					AR_LE <= '0';
					AC_LE<='0';
					AC_OE<= '0';
					DR_LE_IN<='0';
					DR_LE_OUT<='0';
					DR_OE_IN<='0';
					DR_OE_OUT<='0';
					IR_LE<='0';
					IR_OE<='0';
					PC_LE <='0';
					PC_CLR <= '0';
					PC_INC <= '0';
					ROM_CS <= '0';
					RAM_CS <= '0';
					TEMP1_LE <='0';
					TEMP1_OE <= '0';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
					if(RST = '1')then
						next_state <= reset;
					else 
					   next_state <= fetch1;
					end if;
				when reset =>
					PC_OE <= '0';
					AR_LE <= '0';
					AC_LE<='0';
					AC_OE<= '0';
					DR_LE_IN<='0';
					DR_LE_OUT<='0';
					DR_OE_IN<='0';
					DR_OE_OUT<='0';
					IR_LE<='0';
					IR_OE<='0';
					PC_LE <='0';
					PC_CLR <= '1';
					PC_INC <= '0';
					ROM_CS <= '0';
					RAM_CS <= '0';
					TEMP1_LE <='0';
					TEMP1_OE <= '0';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
					next_state <= initial;
				when fetch1 =>
					PC_OE <= '1';
					AR_LE <= '1';
					AC_LE<='0';
					AC_OE<= '0';
					DR_LE_IN<='1';
					DR_LE_OUT<='0';
					DR_OE_IN<='0';
					DR_OE_OUT<='0';
					IR_LE<='0';
					IR_OE<='0';
					PC_LE <='0';
					PC_CLR <= '0';
					PC_INC <= '0';
					ROM_CS <= '1';
					RAM_CS <= '0';
					TEMP1_LE <='0';
					TEMP1_OE <= '0';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
					next_state <= fetch2 ;
				when fetch2 =>
					AR_LE <= '0';
					AC_LE<='0';
					AC_OE<= '0';
					DR_LE_IN<='0';
					DR_LE_OUT<='0';
					DR_OE_IN<='0';
					DR_OE_OUT<='1';
					IR_LE<='1';
					IR_OE<='0';
					PC_LE <='0';
					PC_OE <= '0';
					PC_CLR <= '0';
					PC_INC <= '1';
					ROM_CS <= '0';
					RAM_CS <= '0';
					TEMP1_LE <='0';
					TEMP1_OE <= '0';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
				   next_state <= decode;
				
				when decode =>
					AR_LE <= '0';
					AC_LE<='0';
					AC_OE<= '0';
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
					RAM_CS <= '0';
					TEMP1_LE <='0';
					TEMP1_OE <= '0';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
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
						when others => 
							 next_state <= fetch1;
					end case;
				when load =>
					AR_LE <= '1';
					AC_LE<='0';
					AC_OE<= '0';
					DR_LE_IN<='1';
					DR_LE_OUT<='0';
					DR_OE_IN<='0';
					DR_OE_OUT<='0';
					IR_LE<='0';
					IR_OE<='1';
					PC_LE <='0';
					PC_OE <= '0';
					PC_CLR <= '0';
					PC_INC <= '0';
					ROM_CS <= '0';
					RAM_CS <= '1';
					TEMP1_LE <='0';
					TEMP1_OE <= '0';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '1';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
				   next_state <= load2;
				when load2 =>
					AR_LE <= '0';
					AC_LE<='1';
					AC_OE<= '0';
					DR_LE_IN<='0';
					DR_LE_OUT<='0';
					DR_OE_IN<='0';
					DR_OE_OUT<='1';
					IR_LE<='0';
					IR_OE<='0';
					PC_LE <='0';
					PC_OE <= '0';
					PC_CLR <= '0';
					PC_INC <= '0';
					ROM_CS <= '0';
					RAM_CS <= '0';
					TEMP1_LE <='0';
					TEMP1_OE <= '0';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
				   next_state <= initial;
				when store =>
					AR_LE <= '0';
					AC_LE<='0';
					AC_OE<= '1';
					DR_LE_IN<='0';
					DR_LE_OUT<='1';
					DR_OE_IN<='0';
					DR_OE_OUT<='0';
					IR_LE<='0';
					IR_OE<='0';
					PC_LE <='0';
					PC_OE <= '0';
					PC_CLR <= '0';
					PC_INC <= '0';
					ROM_CS <= '0';
					RAM_CS <= '0';
					TEMP1_LE <='0';
					TEMP1_OE <= '0';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
				   next_state <= store2;
				when store2 =>
					AR_LE <= '1';
					AC_LE<='0';
					AC_OE<= '0';
					DR_LE_IN<='0';
					DR_LE_OUT<='0';
					DR_OE_IN<='1';
					DR_OE_OUT<='0';
					IR_LE<='0';
					IR_OE<='1';
					PC_LE <='0';
					PC_OE <= '0';
					PC_CLR <= '0';
					PC_INC <= '0';
					ROM_CS <= '0';
					RAM_CS <= '1';
					TEMP1_LE <='0';
					TEMP1_OE <= '0';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '0';
					WR <= '1';
					RD <= '0';
					io_cs <= '1';
					ALU_C <= (others=>'Z');
				   next_state <= initial;
				when jump =>
					AR_LE <= '0';
					AC_LE<='0';
					AC_OE<= '0';
					DR_LE_IN<='0';
					DR_LE_OUT<='0';
					DR_OE_IN<='0';
					DR_OE_OUT<='0';
					IR_LE<='0';
					IR_OE<='1';
					PC_LE <='1';
					PC_OE <= '0';
					PC_CLR <= '0';
					PC_INC <= '0';
					ROM_CS <= '0';
					RAM_CS <= '0';
					TEMP1_LE <='0';
					TEMP1_OE <= '0';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
				   next_state <= initial;
				when jumpc =>
					if(CF = '1' )then
						AR_LE <= '0';
						AC_LE<='0';
						AC_OE<= '0';
						DR_LE_IN<='0';
						DR_LE_OUT<='0';
						DR_OE_IN<='0';
						DR_OE_OUT<='0';
						IR_LE<='0';
						IR_OE<='1';
						PC_LE <='1';
						PC_OE <= '0';
						PC_CLR <= '0';
						PC_INC <= '0';
						ROM_CS <= '0';
						RAM_CS <= '0';
						TEMP1_LE <='0';
						TEMP1_OE <= '0';
						TEMP2_LE <= '0';
						TEMP2_OE <= '0';
						TEMP3_LE <= '0';
					   TEMP3_OE <= '0';
						WR <= '0';
						RD <= '0';
						io_cs <= '0';
						ALU_C <= (others=>'Z');
					else
						AR_LE <= '0';
						AC_LE<='0';
						AC_OE<= '0';
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
						RAM_CS <= '0';
						TEMP1_LE <='0';
						TEMP1_OE <= '0';
						TEMP2_LE <= '0';
						TEMP2_OE <= '0';
						TEMP3_LE <= '0';
					   TEMP3_OE <= '0';
						WR <= '0';
						RD <= '0';
						io_cs <= '0';
						ALU_C <= (others=>'Z');
					end if;
					next_state <= initial;
				when andd =>
				   AR_LE <= '1';
					AC_LE<='0';
					AC_OE<= '0';
					DR_LE_IN<='1';
					DR_LE_OUT<='0';
					DR_OE_IN<='0';
					DR_OE_OUT<='0';
					IR_LE<='0';
					IR_OE<='1';
					PC_LE <='0';
					PC_OE <= '0';
			 		PC_CLR <= '0';
					PC_INC <= '0';
					ROM_CS <= '0';
					RAM_CS <= '1';
					TEMP1_LE <='0';
					TEMP1_OE <= '0';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '1';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
					next_state <= andd2;
				when andd2 =>
					AR_LE <= '0';
					AC_LE<='0';
					AC_OE<= '0';
					DR_LE_IN<='0';
					DR_LE_OUT<='0';
					DR_OE_IN<='0';
					DR_OE_OUT<='1';
				   IR_LE<='0';
					IR_OE<='0';
					PC_LE <='0';
					PC_OE <= '0';
					PC_CLR <= '0';
					PC_INC <= '0';
					ROM_CS <= '0';
					RAM_CS <= '0';
					TEMP1_LE <='1';
					TEMP1_OE <= '0';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
					next_state <= andd3;
				when andd3 =>
					AR_LE <= '0';
					AC_LE<='0';
					AC_OE<= '1';
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
					RAM_CS <= '0';
					TEMP1_LE <='0';
					TEMP1_OE <= '0';
					TEMP2_LE <= '1';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
					next_state <= andd4;
            when andd4 =>
					AR_LE <= '0';
					AC_LE<='0';
					AC_OE<= '0';
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
					RAM_CS <= '0';
					TEMP1_LE <='0';
					TEMP1_OE <= '1';
					TEMP2_LE <= '0';
					TEMP2_OE <= '1';
					TEMP3_LE <= '1';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= "00";
					next_state <= andd5;
				when andd5 =>
					AR_LE <= '0';
					AC_LE<='1';
					AC_OE<= '0';
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
					RAM_CS <= '0';
					TEMP1_LE <='0';
					TEMP1_OE <= '0';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '1';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
					next_state <= initial;
				when add =>
					AR_LE <= '1';
					AC_LE<='0';
					AC_OE<= '0';
					DR_LE_IN<='1';
					DR_LE_OUT<='0';
					DR_OE_IN<='0';
					DR_OE_OUT<='0';
				   IR_LE<='0';
					IR_OE<='1';
					PC_LE <='0';
					PC_OE <= '0';
					PC_CLR <= '0';
					PC_INC <= '0';
					ROM_CS <= '0';
					RAM_CS <= '1';
					TEMP1_LE <='0';
					TEMP1_OE <= '0';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '1';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
					next_state <= add2;
				when add2 =>
					AR_LE <= '0';
					AC_LE<='0';
					AC_OE<= '0';
					DR_LE_IN<='0';
					DR_LE_OUT<='0';
					DR_OE_IN<='0';
					DR_OE_OUT<='1';
				   IR_LE<='0';
					IR_OE<='0';
					PC_LE <='0';
					PC_OE <= '0';
					PC_CLR <= '0';
					PC_INC <= '0';
					ROM_CS <= '0';
					RAM_CS <= '0';
					TEMP1_LE <='1';
					TEMP1_OE <= '0';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
					next_state <= add3;
				when add3 =>
					AR_LE <= '0';
					AC_LE<='0';
					AC_OE<= '1';
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
					RAM_CS <= '0';
					TEMP1_LE <='0';
					TEMP1_OE <= '0';
					TEMP2_LE <= '1';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
					next_state <= add4;
				when add4 =>
					AR_LE <= '0';
					AC_LE<='0';
					AC_OE<= '0';
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
					RAM_CS <= '0';
					TEMP1_LE <='0';
					TEMP1_OE <= '1';
					TEMP2_LE <= '0';
					TEMP2_OE <= '1';
					TEMP3_LE <= '1';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= "01";
					next_state <= add5;
				when add5 =>
					AR_LE <= '0';
					AC_LE<='1';
					AC_OE<= '0';
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
					RAM_CS <= '0';
					TEMP1_LE <='0';
					TEMP1_OE <= '0';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '1';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
					next_state <= initial;
				when nott =>
					AR_LE <= '0';
					AC_LE<='0';
					AC_OE<= '1';
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
					RAM_CS <= '0';
					TEMP1_LE <='1';
					TEMP1_OE <= '0';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
					next_state <= nott2;
				when nott2 =>
					AR_LE <= '0';
					AC_LE<='0';
					AC_OE<= '0';
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
					RAM_CS <= '0';
					TEMP1_LE <='0';
					TEMP1_OE <= '1';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '1';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= "10";
					next_state <= nott3;
				when nott3 =>
					AR_LE <= '0';
					AC_LE<='1';
					AC_OE<= '0';
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
					RAM_CS <= '0';
					TEMP1_LE <='0';
					TEMP1_OE <= '0';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '1';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
					next_state <= initial;
				when shift =>
					AR_LE <= '0';
					AC_LE<='0';
					AC_OE<= '1';
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
					RAM_CS <= '0';
					TEMP1_LE <='1';
					TEMP1_OE <= '0';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
					next_state <= shift2;
				when shift2 =>
					AR_LE <= '0';
					AC_LE<='0';
					AC_OE<= '0';
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
					RAM_CS <= '0';
					TEMP1_LE <='0';
					TEMP1_OE <= '1';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '1';
					TEMP3_OE <= '0';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= "11";
					next_state <= shift3;
				when shift3 => 
					AR_LE <= '0';
					AC_LE<='1';
					AC_OE<= '0';
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
					RAM_CS <= '0';
					TEMP1_LE <='0';
					TEMP1_OE <= '0';
					TEMP2_LE <= '0';
					TEMP2_OE <= '0';
					TEMP3_LE <= '0';
					TEMP3_OE <= '1';
					WR <= '0';
					RD <= '0';
					io_cs <= '0';
					ALU_C <= (others=>'Z');
					next_state <= initial;
					
				when others =>
					next_state <= initial;
			end case;
--		 end if;
	end process;
 
end Behavioral;

