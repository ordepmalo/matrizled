-------------------------------------------------------------------------------
-- Title         : Multiplexer
-- Project       : 
-------------------------------------------------------------------------------
-- File          : multiplexer.vhd
-- Author        : Pedro Messias Jose da Cunha Bastos
-- Company       : 
-- Created       : 2015-04-17
-- Last update   : 2015-04-25
-- Target Device : 
-- Standard      : VHDL'93/02
-------------------------------------------------------------------------------
-- Description   : Multiplexer implementation
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

library work;
use work.functions_pkg.all;

entity multiplexer is
  generic (
    N_INPUTS : natural := 32
    );

  port (
    data_32_i : in  std_logic_vector(N_INPUTS - 1 downto 0);
    sel_i     : in  std_logic_vector(log2ceil(N_INPUTS) - 1 downto 0);
    out_o     : out std_logic
    );

end multiplexer;

architecture multiplexer_rtl of multiplexer is

begin

  process(data_32_i, sel_i)

  begin

      out_o <= data_32_i(to_integer(unsigned(sel_i)));

  end process;

end multiplexer_rtl;
