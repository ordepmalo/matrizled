-------------------------------------------------------------------------------
-- Title         : project top file
-- Project       : 
-------------------------------------------------------------------------------
-- File          : matrizled.vhd
-- Author        : Pedro Messias Jose da Cunha Bastos
-- Company       : 
-- Created       : 2015-04-28
-- Last update   : 2015-04-29
-- Target Device : 
-- Standard      : VHDL'93/02
-------------------------------------------------------------------------------
-- Description   :
-------------------------------------------------------------------------------
-- Copyright (c) 2015 
-------------------------------------------------------------------------------
-- Revisions     :
-- Date        Version  Author  Description
-- 2015-04-28  1.0      Ordep   Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity matrizled is

  port (
    sysclk   : in  std_logic;
    reset_n  : in  std_logic;
    data_i   : in  std_logic_vector(17 downto 0);
    serial_o : out std_logic;
    clk_o    : out std_logic;
    stb_o    : out std_logic);

end entity matrizled;

architecture matrizled_rtl of matrizled is

  signal sel_int    : std_logic_vector(4 downto 0);
  signal enable_int : std_logic;

begin  -- architecture matrizled_rtl


  multiplexer_inst1 : entity work.multiplexer
    generic map (
      N_INPUTS => 18)
    port map (
      data_32_i => data_i,
      sel_i     => sel_int,
      out_o     => serial_o);

  clk_divider_inst1 : entity work.clk_divider
    generic map (
      MAX_VALUE => 20)
    port map (
      sysclk        => sysclk,
      reset_n       => reset_n,
      clk_divider_o => enable_int);

  interface_inst1 : entity work.interface
    generic map (
      MAX_VALUE      => 18,
      MAX_VALUE_BITS => 5)
    port map (
      sysclk  => sysclk,
      reset_n => reset_n,
      en_i    => enable_int,
      ctrl_o  => sel_int,
      stb_o   => stb_o,
      clk     => clk_o);


end architecture matrizled_rtl;

