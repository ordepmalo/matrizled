library ieee;
use ieee.std_logic_1164.all;

entity multiplex_32_in_1_out is
	
		port (
					data_32_i : in  std_logic_vector(31 downto 0);
					sel_i		 : in  std_logic_vector(4 downto 0);
					out_o		 : out std_logic
				);

end multiplex_32_in_1_out;

architecture multiplex_32_in_1_out_rtl of multiplex_32_in_1_out is

begin

	process(data_32_i, sel_i)

	begin
	
		case sel_i is
		
			when "00000" => out_o <= data_32_i(0);
			when "00001" => out_o <= data_32_i(1);
			when "00010" => out_o <= data_32_i(2);
			when "00011" => out_o <= data_32_i(3);
			when "00100" => out_o <= data_32_i(4);
			when "00101" => out_o <= data_32_i(5);
			when "00110" => out_o <= data_32_i(6);
			when "00111" => out_o <= data_32_i(7);
			when "01000" => out_o <= data_32_i(8);
			when "01001" => out_o <= data_32_i(9);
			when "01010" => out_o <= data_32_i(10);
			when "01011" => out_o <= data_32_i(11);
			when "01100" => out_o <= data_32_i(12);
			when "01101" => out_o <= data_32_i(13);
			when "01110" => out_o <= data_32_i(14);
			when "01111" => out_o <= data_32_i(15);
			when "10000" => out_o <= data_32_i(16);
			when "10001" => out_o <= data_32_i(17);
			when "10010" => out_o <= data_32_i(18);
			when "10011" => out_o <= data_32_i(19);
			when "10100" => out_o <= data_32_i(20);
			when "10101" => out_o <= data_32_i(21);
			when "10110" => out_o <= data_32_i(22);
			when "10111" => out_o <= data_32_i(23);
			when "11000" => out_o <= data_32_i(24);
			when "11001" => out_o <= data_32_i(25);
			when "11010" => out_o <= data_32_i(26);
			when "11011" => out_o <= data_32_i(27);
			when "11100" => out_o <= data_32_i(28);
			when "11101" => out_o <= data_32_i(29);
			when "11110" => out_o <= data_32_i(30);
			when "11111" => out_o <= data_32_i(31);
			
		end case;
		
	end process;
	
end multiplex_32_in_1_out_rtl;