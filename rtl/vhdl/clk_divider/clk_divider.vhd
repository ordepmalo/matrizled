-------------------------------------------------------------------------------
-- Title         : clk_divider
-- Project       : Integrating Project II
-------------------------------------------------------------------------------
-- File          : clk_divider.vhd
-- Author        : Pedro Messias Jose da Cunha Bastos
-- Company       : 
-- Created       : 2015-04-20
-- Last update   : 2015-04-20
-- Target Device : 
-- Standard      : VHDL'93/02
-------------------------------------------------------------------------------
-- Description   : Clk_implemetation
-------------------------------------------------------------------------------
-- Copyright (c) 2015 
-------------------------------------------------------------------------------
-- Revisions     :
-- Date        Version  Author  Description
-- 2015-04-20  1.0      Ordep	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity clk_divider is
  
  port (
    sysclk        : in  std_logic;      -- clock global
    reset_n       : in  std_logic;      -- reset_global
    clk_divider_o : out std_logic
    );

end entity clk_divider;

architecture clkd_divider_RTL of clk_divider is

 signal cont_clk : unsigned (23 downto 0);
  
begin  -- architecture clkd_divider_RTL

  process(sysclk, reset_n)

  begin

    if reset_n = '0' then
      clk_divider_o  <= '0';
    elsif rising_edge(sysclk) then
      if cont_clk = 23 then
        clk_divider_o <= '1';
      elsif cont_clk < 23 then
        cont_clk <= cont_clk + 1;
      end if;
      
    end if;
  end process;

end architecture clkd_divider_RTL;
