-------------------------------------------------------------------------------
-- Title         : Testbench for design "interface"
-- Project       : 
-------------------------------------------------------------------------------
-- File          : interface_tb.vhd
-- Author        : Pedro Messias Jose da Cunha Bastos
-- Company       : 
-- Created       : 2015-04-23
-- Last update   : 2015-04-24
-- Target Device : 
-- Standard      : VHDL'93/02
-------------------------------------------------------------------------------
-- Description   : 
-------------------------------------------------------------------------------
-- Copyright (c) 2015 
-------------------------------------------------------------------------------
-- Revisions     :
-- Date        Version  Author  Description
-- 2015-04-23  1.0      Ordep   Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity interface_tb is

end entity interface_tb;

-------------------------------------------------------------------------------

architecture interface_tb_rtl of interface_tb is

  -- component generics
  constant MAX_VALUE      : natural := 32;
  constant MAX_VALUE_BITS : natural := 5;

  -- component ports
  signal sysclk  : std_logic := '0';
  signal reset_n : std_logic := '0';
  signal en_i    : std_logic := '0';
  signal ctrl_o  : std_logic_vector(MAX_VALUE_BITS - 1 downto 0);
  signal stb_o   : std_logic;
  signal clk     : std_logic;

begin  -- architecture interface_tb_rtl

  -- component instantiation
  DUT : entity work.interface
    generic map (
      MAX_VALUE      => MAX_VALUE,
      MAX_VALUE_BITS => MAX_VALUE_BITS)
    port map (
      sysclk  => sysclk,
      reset_n => reset_n,
      en_i    => en_i,
      ctrl_o  => ctrl_o,
      stb_o   => stb_o,
      clk     => clk);

  -- clock generation
  sysclk <= not sysclk after 5 NS;

  -- reset generation
  reset_proc : process
  begin
    reset_n <= '0';
    wait for 50 US;
    reset_n <= '1';
    wait;
  end process reset_proc;

  -- Stimulus generation
  stimulus_proc : process
  begin

    wait for 100 US;
    loop
      wait until sysclk = '1';
      en_i <= '1';
      wait for 10 NS;
      en_i <= '0';
      wait for 100 US;
    end loop;

    -- Add stimulus here

    wait;
  end process stimulus_proc;



end architecture interface_tb_rtl;

-------------------------------------------------------------------------------

configuration interface_tb_interface_tb_rtl_cfg of interface_tb is
  for interface_tb_rtl
  end for;
end interface_tb_interface_tb_rtl_cfg;

-------------------------------------------------------------------------------
