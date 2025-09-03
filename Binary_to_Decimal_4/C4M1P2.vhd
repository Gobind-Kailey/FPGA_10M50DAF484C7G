library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity C4M1P2 is
    Port (
        SW     : in  STD_LOGIC_VECTOR(3 downto 0);  -- V = SW3-0
        HEX1   : out STD_LOGIC_VECTOR(7 downto 0);  -- Tens digit
        HEX0   : out STD_LOGIC_VECTOR(7 downto 0)   -- Ones digit
    );
end C4M1P2;

architecture Behavioral of C4M1P2 is
    signal V  : STD_LOGIC_VECTOR(3 downto 0);
    signal A  : STD_LOGIC_VECTOR(3 downto 0);
    signal D0 : STD_LOGIC_VECTOR(3 downto 0);
    signal D1 : STD_LOGIC_VECTOR(3 downto 0);
    signal z  : STD_LOGIC;
begin
    V <= SW; -- This is important 

    -- z = 1 when V > 9  (excludes 8=1000 and 9=1001)
    z <= V(3) AND (V(2) OR V(1));

    -- Circuit A: maps 1010..1111 → 0000..0101
    A(3) <= '0';
    A(2) <= V(3) AND V(2) AND V(1);
    A(1) <= V(3) AND V(2) AND (NOT V(1));
    A(0) <= V(0);

    -- 4-bit 2→1 MUX for ones digit
    D0(3) <= (NOT z AND V(3)) OR (z AND A(3)); -- 1 
    D0(2) <= (NOT z AND V(2)) OR (z AND A(2));
    D0(1) <= (NOT z AND V(1)) OR (z AND A(1));
    D0(0) <= (NOT z AND V(0)) OR (z AND A(0));

    -- Tens digit: 0 if z=0, 1 if z=1
    D1 <= "000" & z;

    -- 7-seg decoder (active-low) for HEX0 (ones)
    HEX0 <= "11000000" when D0 = "0000" else  -- 0
            "11111001" when D0 = "0001" else  -- 1
            "10100100" when D0 = "0010" else  -- 2
            "10110000" when D0 = "0011" else  -- 3
            "10011001" when D0 = "0100" else  -- 4
            "10010010" when D0 = "0101" else  -- 5
            "10000010" when D0 = "0110" else  -- 6
            "11111000" when D0 = "0111" else  -- 7
            "10000000" when D0 = "1000" else  -- 8
            "10010000" when D0 = "1001" else  -- 9
            "11111111";                       -- blank

    -- 7-seg decoder (active-low) for HEX1 (tens: 0 or 1)
    HEX1 <= "11000000" when D1 = "0000" else  -- 0
            "11111001" when D1 = "0001" else  -- 1
            "11111111";                       -- blank (shouldn't occur)
end Behavioral;
