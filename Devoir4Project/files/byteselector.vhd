library IEEE; use IEEE.STD_LOGIC_1164.all;

entity byteselector is -- sign extender
	port(	a: in STD_LOGIC_VECTOR (7 downto 0);
			y: out STD_LOGIC_VECTOR (31 downto 0));
end;

architecture behave of byteselector is
begin
	y <= X"000000" & a ;
end;