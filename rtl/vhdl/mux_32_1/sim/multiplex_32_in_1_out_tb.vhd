-------------------------------------------------------------------------------
-- Title         : Testbench for design "multiplex_32_in_1_out"
-- Project       : 
-------------------------------------------------------------------------------
-- File          : multiplex_32_in_1_out_tb.vhd
-- Author        : Pedro Messias Jose da Cunha Bastos
-- Company       : 
-- Created       : 2015-04-21
-- Last update   : 2015-04-21
-- Target Device : 
-- Standard      : VHDL'93/02
-------------------------------------------------------------------------------
-- Description   : 
-------------------------------------------------------------------------------
-- Copyright (c) 2015 
-------------------------------------------------------------------------------
-- Revisions     :
-- Date        Version  Author  Description
-- 2015-04-21  1.0      Ordep   Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity multiplex_32_in_1_out_tb is

end entity multiplex_32_in_1_out_tb;

-------------------------------------------------------------------------------

architecture multiplex_32_in_1_out_tb_rtl of multiplex_32_in_1_out_tb is

  -- component ports
  signal data_32_i : std_logic_vector(31 downto 0) := x"55555555";
  signal sel_i     : std_logic_vector(4 downto 0)  := (others => '0');
  signal out_o     : std_logic;

begin  -- architecture multiplex_32_in_1_out_tb_rtl

  -- component instantiation
  DUT : entity work.multiplex_32_in_1_out
    port map (
      data_32_i => data_32_i,
      sel_i     => sel_i,
      out_o     => out_o);

  -- clock generation
  -- Stimulus generation
  stimulus_proc : process
  begin
    wait for 100 US;
    sel_i <= "00000";
    wait for 1 US;
    sel_i <= "00001";
    wait for 1 US;
    sel_i <= "00010";
    wait for 1 US;
    sel_i <= "00011";
    wait for 1 US;
    sel_i <= "00100";
    wait for 1 US;
    sel_i <= "00101";
    wait for 1 US;
    sel_i <= "00110";
    wait for 1 US;
    sel_i <= "00111";
    wait for 1 US;
    sel_i <= "01000";
    wait for 1 US;
    sel_i <= "01001";
    wait for 1 US;
    sel_i <= "01010";
    wait for 1 US;
    sel_i <= "01011";
    wait for 1 US;
    sel_i <= "01100";
    wait for 1 US;
    sel_i <= "01101";
    wait for 1 US;
    sel_i <= "01110";
    wait for 1 US;
    sel_i <= "01111";
    wait for 1 US;
    sel_i <= "10000";
    wait for 1 US;
    sel_i <= "10001";
    wait for 1 US;
    sel_i <= "10010";
    wait for 1 US;
    sel_i <= "10011";
    wait for 1 US;
    sel_i <= "10100";
    wait for 1 US;
    sel_i <= "10101";
    wait for 1 US;
    sel_i <= "10110";
    wait for 1 US;
    sel_i <= "10111";
    wait for 1 US;
    sel_i <= "11000";
    wait for 1 US;
    sel_i <= "11001";
    wait for 1 US;
    sel_i <= "11010";
    wait for 1 US;
    sel_i <= "11011";
    wait for 1 US;
    sel_i <= "11100";
    wait for 1 US;
    sel_i <= "01101";
    wait for 1 US;
    sel_i <= "11110";
    wait for 1 US;
    sel_i <= "11111";

  -- Add stimulus here

  wait;
end process stimulus_proc;



end architecture multiplex_32_in_1_out_tb_rtl;

-------------------------------------------------------------------------------

configuration multiplex_32_in_1_out_tb_multiplex_32_in_1_out_tb_rtl_cfg of multiplex_32_in_1_out_tb is
  for multiplex_32_in_1_out_tb_rtl
  end for;
end multiplex_32_in_1_out_tb_multiplex_32_in_1_out_tb_rtl_cfg;

-------------------------------------------------------------------------------
