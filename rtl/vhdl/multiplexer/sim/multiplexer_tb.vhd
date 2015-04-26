-------------------------------------------------------------------------------
-- Title         : Testbench for design "multiplexer"
-- Project       : 
-------------------------------------------------------------------------------
-- File          : multiplexer_tb.vhd
-- Author        : Pedro Messias Jose da Cunha Bastos
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
-- 2015-04-25  1.0      Ordep	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.functions_pkg.all;

-------------------------------------------------------------------------------

entity multiplexer_tb is

end entity multiplexer_tb;

-------------------------------------------------------------------------------

architecture multiplexer_tb_rtl of multiplexer_tb is

  -- component generics
  constant N_INPUTS : natural := 32;

  -- component ports
  signal data_32_i : std_logic_vector(N_INPUTS - 1 downto 0)           := (others => '0');
  signal sel_i     : std_logic_vector(log2ceil(N_INPUTS) - 1 downto 0) := (others => '0');
  signal out_o     : std_logic;

begin  -- architecture multiplexer_tb_rtl

  -- component instantiation
  DUT: entity work.multiplexer
    generic map (
      N_INPUTS => N_INPUTS)
    port map (
      data_32_i => data_32_i,
      sel_i     => sel_i,
      out_o     => out_o);

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
    variable counter : unsigned(log2ceil(N_INPUTS) - 1 downto 0) := (others => '0');
  begin
    -- Add stimulus here
    

    wait for 100 US;
    loop 
      sel_i <= std_logic_vector(counter);
      wait for 1 US;
      if counter = N_INPUTS - 1 then
        wait;
      end if;
      counter := counter + 1;
    end loop;
    
    wait;
  end process stimulus_proc;

  

end architecture multiplexer_tb_rtl;

-------------------------------------------------------------------------------

configuration multiplexer_tb_multiplexer_tb_rtl_cfg of multiplexer_tb is
  for multiplexer_tb_rtl
  end for;
end multiplexer_tb_multiplexer_tb_rtl_cfg;

-------------------------------------------------------------------------------
