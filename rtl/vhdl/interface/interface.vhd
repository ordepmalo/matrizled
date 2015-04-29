-------------------------------------------------------------------------------
-- Title         : Interface to Hardware
-- Project       : 
-------------------------------------------------------------------------------
-- File          : interface.vhd
-- Author        : Pedro Messias Jose da Cunha Bastos
-- Company       : 
-- Created       : 2015-04-17
-- Last update   : 2015-04-28
-- Target Device : 
-- Standard      : VHDL'93/02
-------------------------------------------------------------------------------
-- Description   : Interface Implementation
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

entity interface is

  generic (
    MAX_VALUE      : natural := 32;
    MAX_VALUE_BITS : natural := 5
    );

  port (
    sysclk  : in  std_logic;            -- clock global module DE2
    reset_n : in  std_logic;            -- reset global
    en_i    : in  std_logic;            -- signal do clk_divider
    ctrl_o  : out std_logic_vector(MAX_VALUE_BITS - 1 downto 0);  -- signal que vai para o sel_i
    stb_o   : out std_logic;
    clk     : out std_logic
    );

end interface;

architecture interface_rtl of interface is

  type INTERFACE_ST_TYPE is (ST_INIT, ST_SET_CLK, ST_SET_CLK_LOW, ST_VERIFY, ST_SET_STB, ST_SET_STB_LOW);
  attribute syn_enconding                      : string;
  attribute syn_enconding of INTERFACE_ST_TYPE : type is "safe";  -- FSM para n

  signal state_reg  : INTERFACE_ST_TYPE;
  signal state_next : INTERFACE_ST_TYPE;
  signal count_reg  : unsigned(MAX_VALUE_BITS - 1 downto 0);
  signal count_next : unsigned(MAX_VALUE_BITS - 1 downto 0);
  signal clk_reg    : std_logic;
  signal clk_next   : std_logic;
  signal stb_reg    : std_logic;
  signal stb_next   : std_logic;


begin

  ctrl_o <= std_logic_vector(count_reg);
  clk    <= clk_reg;
  stb_o  <= stb_reg;

  process(reset_n, sysclk)

  begin

    if reset_n = '0' then
      state_reg <= ST_INIT;
      count_reg <= (others => '0');
      clk_reg   <= '0';
      stb_reg   <= '0';
    elsif rising_edge(sysclk) then  -- sysclk = 50.000.000 (frequency of FPGA on DE2 module)
      state_reg <= state_next;
      count_reg <= count_next;
      clk_reg   <= clk_next;
      stb_reg   <= stb_next;
    end if;

  end process;

  process(clk_reg, count_reg, en_i, state_reg, stb_reg)

  begin

    state_next <= state_reg;
    count_next <= count_reg;
    clk_next   <= clk_reg;
    stb_next   <= stb_reg;

    case state_reg is

      when ST_INIT =>
        state_next <= ST_SET_CLK;
        count_next <= (others => '0');  -- zerar o contador
        clk_next   <= '0';
        stb_next   <= '0';

      when ST_SET_CLK =>
        if en_i = '1' then
          clk_next   <= '1';
          state_next <= ST_SET_CLK_LOW;
        end if;

      when ST_SET_CLK_LOW =>
        if en_i = '1' then
          state_next <= ST_VERIFY;
          clk_next   <= '0';
        end if;

      when ST_VERIFY =>
        if count_reg = MAX_VALUE - 1 then
          state_next <= ST_SET_STB;
        else
          count_next <= count_reg + 1;
          state_next <= ST_SET_CLK;
        end if;

      when ST_SET_STB =>
        if en_i = '1' then
          stb_next   <= '1';
          state_next <= ST_SET_STB_LOW;
        end if;

      when ST_SET_STB_LOW =>
        if en_i = '1' then
          stb_next   <= '0';
          state_next <= ST_INIT;
        end if;

    end case;

  end process;

end interface_rtl;
