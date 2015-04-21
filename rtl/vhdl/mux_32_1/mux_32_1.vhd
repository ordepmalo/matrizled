-------------------------------------------------------------------------------
-- Title         : Multiplexer
-- Project       : 
-------------------------------------------------------------------------------
-- File          : mux_32_1.vhd
-- Author        : Pedro Messias Jose da Cunha Bastos
-- Company       : 
-- Created       : 2015-04-17
-- Last update   : 2015-04-21
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

entity multiplex_32_in_1_out is

  port (
    data_32_i : in  std_logic_vector(31 downto 0);
    sel_i     : in  std_logic_vector(4 downto 0);
    out_o     : out std_logic
    );

end multiplex_32_in_1_out;

architecture multiplex_32_in_1_out_rtl of multiplex_32_in_1_out is

begin

  process(data_32_i, sel_i)

  begin

      out_o <= data_32_i(to_integer(unsigned(sel_i)));

  end process;

end multiplex_32_in_1_out_rtl;
