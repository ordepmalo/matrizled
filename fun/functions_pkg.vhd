-------------------------------------------------------------------------------
-- Title         : Functions Package File
-- Project       : 
-------------------------------------------------------------------------------
-- File          : functions.vhd
-- Author        : Lucas Groposo
-- Company       : 
-- Created       : 2015-04-25
-- Last update   : 2015-04-25
-- Target Device : 
-- Standard      : VHDL'93/02
-------------------------------------------------------------------------------
-- Description   : 
-------------------------------------------------------------------------------
-- Copyright (c) 2015 
-------------------------------------------------------------------------------
-- Revisions     :
-- Date        Version  Author  Description
-- 2015-04-25  1.0      groposo Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package functions_pkg is

  function log2ceil (
    L : positive)
    return natural;

  function srlInteger (
    arg : integer;
    s   : natural)
    return integer;

end package functions_pkg;

package body functions_pkg is

  function log2ceil (L : positive) return natural is
    variable i, bitCount : natural;
  begin
    i        := L-1;
    bitCount := 0;
    while (i > 0) loop
      bitCount := bitCount + 1;
      i        := srlInteger(i, 1);
    end loop;
    return bitCount;
  end log2ceil;

  function srlInteger(arg : integer; s : natural) return integer is
  begin
    return to_integer(SHIFT_RIGHT(to_UNSIGNED(ARG, 32), s));
  end srlInteger;


end package body functions_pkg;
