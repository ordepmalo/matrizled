-------------------------------------------------------------------------------
-- Title         : clk_divider
-- Project       : Integrating Project II
-------------------------------------------------------------------------------
-- File          : clk_divider.vhd
-- Author        : Pedro Messias Jose da Cunha Bastos
-- Company       : 
-- Created       : 2015-04-20
-- Last update   : 2015-05-06
-- Target Device : 
-- Standard      : VHDL'93/02
-------------------------------------------------------------------------------
-- Description   : Clk_implemetation
-------------------------------------------------------------------------------
-- Copyright (c) 2015 
-------------------------------------------------------------------------------
-- Revisions     :
-- Date        Version  Author  Description
-- 2015-04-20  1.0      Ordep   Created
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

--library work;
--use work.function_pkg.all;

entity clk_divider is

  generic(
    MAX_VALUE : natural := 20
    );

  port (
    sysclk        : in  std_logic;      -- clock global
    reset_n       : in  std_logic;      -- reset_global
    clk_divider_o : out std_logic
    );

end entity clk_divider;

architecture clkd_divider_rtl of clk_divider is

  signal cont_next        : unsigned(4 downto 0);  -- entrada
  signal cont_reg         : unsigned(4 downto 0);  -- saida
  signal clk_divided_next : std_logic;
  signal clk_divided_reg  : std_logic;

begin  -- architecture clkd_divider_RTL

  clk_divider_o <= clk_divided_reg;


  process(sysclk, reset_n)

  begin

    if reset_n = '0' then
      cont_reg        <= (others => '0');
      clk_divided_reg <= '0';
    elsif rising_edge(sysclk) then
      cont_reg        <= cont_next;
      clk_divided_reg <= clk_divided_next;

    end if;

  end process;

  process(clk_divided_reg, cont_reg) is

  begin  -- process

    cont_next        <= cont_reg;
    clk_divided_next <= clk_divided_reg;

    if cont_reg <= MAX_VALUE then
      cont_next        <= cont_reg + 1;
      clk_divided_next <= '0';
    else
      cont_next        <= (others => '0');
      clk_divided_next <= '1';


    end if;
  end process;

end architecture clkd_divider_RTL;
