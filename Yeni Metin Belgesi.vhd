-- Import Libraries --
library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity Clk_set is
	port( 	h_in:   in  std_logic;
		m_in:	in  std_logic;
		s_in:   in  std_logic;
		H1  : out std_logic_vector (3 downto 0);
                H2  : out std_logic_vector (3 downto 0);
                M1  : out std_logic_vector (3 downto 0);
                M2  : out std_logic_vector (3 downto 0);
                S1  : out std_logic_vector (3 downto 0);
                S2  : out std_logic_vector (3 downto 0)
		  );
end Clk_set;


architecture Behaviour of Clk_set is   

signal s_H1  : unsigned (3 downto 0) :=(others => '0'); -- Hours
signal s_H2  : unsigned (3 downto 0) :=(others => '0'); -- Tens of hours 
signal s_M1  : unsigned (3 downto 0) :=(others => '0'); -- Minutes
signal s_M2  : unsigned (3 downto 0) :=(others => '0'); -- Tens of minutes 
signal s_S1  : unsigned (3 downto 0) :=(others => '0'); -- Seconds
signal s_S2  : unsigned (3 downto 0) :=(others => '0'); -- Tens of seconds


second_p:process(s_in)
begin
    if rising_edge(s_in) then        
                if(s_S1 < "1000") 
                    then s_S1 <= s_S1 + 1;
                else 
                    s_S2 <= s_S2 + 1;
                    s_S1 <= (others => '0');
                if(s_S2 > "0100") then
                    s_S2 <= (others => '0');
		    s_S1 <= (others => '0');
                end if;
                end if;
    end if;

end process second_p;

minute_p:process(m_in)
begin

    if rising_edge(m_in) then          
		  s_M1 <= s_M1 + 1;
                if(s_M1 > "1000") then
                    s_M2 <= s_M2 + 1;
                    s_M1 <= (others => '0');
                if(s_M2 > "0100") then 
                    s_M2 <= (others => '0'); 
		    s_M1 <= (others => '0');
		end if;
		end if;
    end if;

end process minute_p;
hour_p:process(h_in)
begin

    if rising_edge(h_in) then
                if(s_H1 > "0100") then 
                    s_H1 <= s_H1 + 1;
                if(s_H1 > "1000") then 
                    s_H2 <= s_H2 + 1;
                    s_H1 <= (others => '0');
                        else if (s_H1 = "0011") and (s_H2 = "0010") then
                            s_H1 <= (others => '0');
                            s_H2 <= (others => '0');
                        end if;
                end if;
                end if;
    end if;

end process hour_p;

    H1 <= std_logic_vector(s_H1);
    H2 <= std_logic_vector(s_H2);
    M1 <= std_logic_vector(s_M1);
    M2 <= std_logic_vector(s_M2);
    S1 <= std_logic_vector(s_S1);
    S2 <= std_logic_vector(s_S2);
end Behavioral;
