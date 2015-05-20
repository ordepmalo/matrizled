-------------------------------------------------------------------------------
-- Title         : Testbench for design "edit_msg"
-- Project       : 
-------------------------------------------------------------------------------
-- File          : edit_msg_tb.vhd
-- Author        : Pedro Bastos
-- Company       : 
-- Created       : 2015-05-19
-- Last update   : 2015-05-19
-- Target Device : 
-- Standard      : VHDL'93/02
-------------------------------------------------------------------------------
-- Description   : 
-------------------------------------------------------------------------------
-- Copyright (c) 2015 
-------------------------------------------------------------------------------
-- Revisions     :
-- Date        Version  Author  Description
-- 2015-05-19  1.0      Ordep   Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity edit_msg_tb is

end entity edit_msg_tb;

-------------------------------------------------------------------------------

architecture edit_msg_tb_rtl of edit_msg_tb is

  -- component ports
  signal data_o  : std_logic_vector (31 downto 0);
  signal stb_i   : std_logic := '0';
  signal sysclk  : std_logic := '0';
  signal reset_n : std_logic := '0';

begin  -- architecture edit_msg_tb_rtl

  -- component instantiation
  DUT : entity work.edit_msg
    port map (
      data_o  => data_o,
      stb_i   => stb_i,
      sysclk  => sysclk,
      reset_n => reset_n);

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
    -- Add stimulus here
    wait for 100 US;
    loop
      stb_i <= '1';
      wait for 10 NS;
      stb_i <= '0';
      wait for 100 US;
    end loop;
    wait;
  end process stimulus_proc;



end architecture edit_msg_tb_rtl;

-------------------------------------------------------------------------------

configuration edit_msg_tb_edit_msg_tb_rtl_cfg of edit_msg_tb is
  for edit_msg_tb_rtl
  end for;
end edit_msg_tb_edit_msg_tb_rtl_cfg;

-------------------------------------------------------------------------------
