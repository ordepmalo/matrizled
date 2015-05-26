-------------------------------------------------------------------------------
-- Title         : 
-- Project       : 
-------------------------------------------------------------------------------
-- File          : edit_msg.vhd
-- Author        : Pedro Messias Jose da Cunha Bastos
-- Company       : 
-- Created       : 2015-04-17
-- Last update   : 2015-05-20
-- Target Device : 
-- Standard      : VHDL'93/02
-------------------------------------------------------------------------------
-- Description   : Edit_msg Implementation
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

entity edit_msg is

  port (
    data_o  : out std_logic_vector (31 downto 0);
    stb_i   : in  std_logic;
    sysclk  : in  std_logic;            -- global clock
    reset_n : in  std_logic             -- global reset
    );

end entity edit_msg;

architecture edit_msg_rtl of edit_msg is

  type MSG_ST_TYPE is (ST_INIT, ST_VERIFY);
  attribute syn_enconding                : string;
  attribute syn_enconding of MSG_ST_TYPE : type is "safe";  -- FSM para n
  type MSG_BUFFER_TYPE is array(0 to 7) of std_logic_vector(31 downto 0);

  signal state_reg       : MSG_ST_TYPE;
  signal state_next      : MSG_ST_TYPE;
  signal msg_buffer_reg  : MSG_BUFFER_TYPE;
  signal msg_buffer_next : MSG_BUFFER_TYPE;
  signal cont_reg        : unsigned(2 downto 0);
  signal cont_next       : unsigned(2 downto 0);
  signal dataout_reg     : std_logic_vector(31 downto 0);
  signal dataout_next    : std_logic_vector(31 downto 0);

begin  -- architecture edit_msg_rtl

  data_o <= dataout_reg;

  process(reset_n, sysclk)

  begin

    if reset_n = '0' then
      state_reg <= ST_INIT;
      for i in 0 to 7 loop
        msg_buffer_reg(i) <= (others => '0');
      end loop;  -- i
      dataout_reg <= (others => '0');
      cont_reg    <= (others => '0');

    elsif rising_edge(sysclk) then
      state_reg      <= state_next;
      msg_buffer_reg <= msg_buffer_next;
      dataout_reg    <= dataout_next;
      cont_reg       <= cont_next;

    end if;

  end process;


  process (cont_reg, msg_buffer_reg, state_reg, stb_i)

  begin

    state_next      <= state_reg;
    msg_buffer_next <= msg_buffer_reg;
    dataout_next    <= msg_buffer_reg(to_integer(cont_reg));
    cont_next       <= cont_reg;

    case state_reg is

      when ST_INIT =>
        state_next <= ST_VERIFY;

      when ST_VERIFY =>
        if stb_i = '1' then
          cont_next <= cont_reg + 1;
        end if;

    end case;

    msg_buffer_next(0) <= x"10000001";
    msg_buffer_next(1) <= x"02222222";
    msg_buffer_next(2) <= x"04333333";
    msg_buffer_next(3) <= x"08444444";
    msg_buffer_next(4) <= x"10555555";
    msg_buffer_next(5) <= x"20666666";
    msg_buffer_next(6) <= x"40777777";
    msg_buffer_next(7) <= x"80888888";

  end process;

end architecture edit_msg_rtl;
























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































