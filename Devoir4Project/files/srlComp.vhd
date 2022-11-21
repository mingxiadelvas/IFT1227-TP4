library IEEE; use IEEE.STD_LOGIC_1164.all;use IEEE.numeric_std.all;

entity srlComp is 
	port(	a: in STD_LOGIC_VECTOR (31 downto 0);
            dec:in STD_LOGIC_VECTOR (4 downto 0);
			y: out STD_LOGIC_VECTOR (31 downto 0));
end;

architecture behave2 of srlComp is
signal temp:integer;
begin
	temp<=to_integer(signed(dec));
	y <= std_logic_vector(shift_right(signed(a),temp));
end ;