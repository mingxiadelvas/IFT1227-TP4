library IEEE; use IEEE.STD_LOGIC_1164.all;

entity maindec is -- main control decoder
	port (op,funct: in STD_LOGIC_VECTOR (5 downto 0);
			memtoreg : out  STD_LOGIC_VECTOR(1 downto 0);
			 memwrite,branch: out STD_LOGIC;
			 alusrc: out  STD_LOGIC_VECTOR(1 downto 0);
			regdst, regwrite: out STD_LOGIC;
			jump: out  STD_LOGIC_VECTOR(1 downto 0);
			aluop: out STD_LOGIC_VECTOR (1 downto 0));
end;

architecture behave of maindec is
	signal controls: STD_LOGIC_VECTOR(11 downto 0);
begin
process(op) begin
	case op is
		when "000000" =>
		if funct="001000" then controls <="000000001000";--jr
		elsif funct="111111" then controls<="110000000010";--orNot
		elsif funct="000010" then controls<="110000110000";--srl
		else controls <= "110000000010"; -- Rtyp
		end if;
		when "001100" =>controls <="101000000011"; --andi
		when "100000" =>controls <="100100100000";--LB
		when "100011" => controls <= "100100010000"; -- LW
		when "101011" => controls <= "000101000000"; -- SW
		when "000100" => controls <= "000010000001"; -- BEQ
		when "001000" => controls <= "100100000000"; -- ADDI
		when "000010" => controls <= "000000000100"; -- J
		when others => controls <= "------------"; -- illegal op
	end case;
end process;

	regwrite <= controls(11);
	regdst <= controls(10);
	alusrc <= controls(9 downto 8);
	branch <= controls(7);
	memwrite <= controls(6);
	memtoreg <= controls(5 downto 4);
	jump <= controls(3 downto 2);
	aluop <= controls(1 downto 0);
end;