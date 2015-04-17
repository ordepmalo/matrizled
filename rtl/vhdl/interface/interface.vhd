----------------------------------------------------------------------------------------------------------------------------------
-- Title			: Interface to hardware		
-- Project			: Integrating Project II						
----------------------------------------------------------------------------------------------------------------------------------
-- File				: interface.vhd					
-- Author			: Pedro Messias José da Cunha Bastos		
-- Company			: 														
-- Created			: 15/04/2015										
-- Last Update		: 16/04/2015														
-- Target Device	:														
-- Standard			: VHDL'93											
----------------------------------------------------------------------------------------------------------------------------------
-- Description		: Interface implementation						
----------------------------------------------------------------------------------------------------------------------------------
-- Copyright (c) 2015
----------------------------------------------------------------------------------------------------------------------------------
-- Revisions	:
-- Date				Version		Author	Description				
--
----------------------------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity interface is

	generic (
				MAX_VALUE : NATURAL := 32;
				MAX_VALUE_BITS : NATURAL := 5
				
			);

	port (
			sysclk			: in std_logic;
			reset_n			: in std_logic;
			data_i			: in std_logic_vector(31 downto 0);
			data_serial_o	: out std_logic;
			stb_o			: out std_logic;
			clk				: out std_logic
		);
			
end interface;

architecture interface_rtl of interface is

type INTERFACE_ST_TYPE is (ST_INIT, ST_INCR, ST_VERIFY);

signal state_reg		: INTERFACE_ST_TYPE;
signal state_next		: INTERFACE_ST_TYPE;
signal counter_reg		: unsigned(MAX_VALUE_BITS - 1 downto 0);
signal counter_next		: unsigned(MAX_VALUE_BITS - 1  downto 0);
signal clk_divider 		: std_logic;
signal prescaler		: unsigned (23 downto 0);

begin

	process(sysclk, reset_n)

	begin

		state_reg 	<= state_next;
		counter_reg <= counter_next;
	
		if reset_n = '0' then
			state_reg 	<= ST_INIT;
			counter_reg <= (others => '0');
			clk_divider <= '0';
			prescaler <= (others => '0');
		elsif rising_edge(sysclk) then 			-- sysclk = 50.000.000 (frequency of FPGA on DE2 module)
			if prescaler = 23 then
				prescaler <= (others => '0');
				clk_divider <= not clk_divider;
			else
				prescaler <= prescaler + 1;
			end if;
		
 		state_reg 	<= state_next;
		counter_reg <= counter_next;
		
		end if;
	
	end process;

	process(state_reg, counter_reg)

	begin

		state_next <= state_reg;
		counter_next <= counter_reg;
	
		case state_reg is
	
			when ST_INIT =>
				state_next <= ST_INCR;
		
			when ST_INCR => 
				counter_next <= counter_reg + 1;
				state_next <= ST_VERIFY;
			
			when ST_VERIFY => 
				if counter_reg >= MAX_VALUE then
					state_next <= ST_INIT;
				else state_next <= ST_INCR;
				end if;
			
		end case;

	end process;

end interface_rtl;