-------------------------------------------------------------------------------
-- Title         : Interface to Hardware
-- Project       : 
-------------------------------------------------------------------------------
-- File          : interface.vhd
-- Author        : Pedro Messias Jose da Cunha Bastos
-- Company       : 
-- Created       : 2015-04-17
-- Last update   : 2015-04-22
-- Target Device : 
-- Standard      : VHDL'93/02
-------------------------------------------------------------------------------
-- Description   : Interface Implementation
-------------------------------------------------------------------------------
-- Copyright (c) 2015 
-------------------------------------------------------------------------------
-- Revisions     :
-- Date        Version  Author  Description
-- 2015-04-17  1.0      Ordep   Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity interface is

  generic (
    MAX_VALUE      : natural := 32;
    MAX_VALUE_BITS : natural := 5
    );

  port (
    sysclk  : in  std_logic;
    reset_n : in  std_logic;
    en_i    : in  std_logic;
    ctrl_o  : in  std_logic;
    stb_o   : out std_logic;
    clk     : out std_logic
    );

end interface;

architecture interface_rtl of interface is

  type INTERFACE_ST_TYPE is (ST_INIT, ST_INCR, ST_VERIFY);

  signal state_reg  : INTERFACE_ST_TYPE;
  signal state_next : INTERFACE_ST_TYPE;
  signal count_reg  : unsigned(MAX_VALUE_BITS - 1 downto 0);
  signal count_next : unsigned(MAX_VALUE_BITS - 1 downto 0);

begin

  process(sysclk, reset_n)

  begin

    if reset_n = '0' then
      state_reg <= ST_INIT;
      count_reg <= (others => '0');
    elsif rising_edge(sysclk) then  -- sysclk = 50.000.000 (frequency of FPGA on DE2 module)
    else
    end if;

    state_reg <= state_next;
    count_reg <= count_next;

  end if;

end process;

process(state_reg, count_reg)

begin

  state_next <= state_reg;
  count_next <= count_reg;

  case state_reg is

    when ST_INIT =>
      state_next <= ST_INIT;

    when ST_INCR =>
      if en_i = '1' then
        count_next <= count_reg + 1;
      end if;
      state_next <= ST_VERIFY;

    when ST_VERIFY =>
      if count_reg >= MAX_VALUE then
        state_next <= ST_INIT;
      else state_next <= ST_INCR;
      end if;

  end case;

end process;

end interface_rtl;
