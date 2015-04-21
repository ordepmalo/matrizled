-------------------------------------------------------------------------------
-- Title         : Testbench for design "clk_divider"
-- Project       : 
-------------------------------------------------------------------------------
-- File          : clk_divider_tb.vhd
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
-- 2015-04-21  1.0      Ordep	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity clk_divider_tb is

end entity clk_divider_tb;

-------------------------------------------------------------------------------

architecture clk_divider_tb_rtl of clk_divider_tb is

  -- component generics
  constant MAX_VALUE : natural := 20;

  -- component ports
  signal sysclk        : std_logic := '0';
  signal reset_n       : std_logic := '0';
  signal clk_divider_o : std_logic;

begin  -- architecture clk_divider_tb_rtl

  -- component instantiation
  DUT: entity work.clk_divider
    generic map (
      MAX_VALUE => MAX_VALUE)
    port map (
      sysclk        => sysclk,
      reset_n       => reset_n,
      clk_divider_o => clk_divider_o);

  -- clock generation
  sysclk <= not sysclk after 5 ns;

  -- reset generation
  reset_proc: process
  begin
    reset_n <= '0';
    wait for 50 us; 
    reset_n <= '1';
    wait;
  end process reset_proc;

  -- Stimulus generation
  stimulus_proc : process
  begin
    -- Add stimulus here

    wait;
  end process stimulus_proc;

  

end architecture clk_divider_tb_rtl;

-------------------------------------------------------------------------------

configuration clk_divider_tb_clk_divider_tb_rtl_cfg of clk_divider_tb is
  for clk_divider_tb_rtl
  end for;
end clk_divider_tb_clk_divider_tb_rtl_cfg;

-------------------------------------------------------------------------------
