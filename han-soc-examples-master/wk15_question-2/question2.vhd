--------------------------------------------------------------------
--! \file      question2.vhd
--! \date      see top of 'Version History'
--! \brief     Question 2 form week 15 class.
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN AEA ESE Arnhem 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |16-12-2022 |WLGRW   |First release
--!
--!
--! Assignment:
--! -----------
--! Given the following VHDL code:
--! 1: what is the value of y if a = "1101" and b = "0110"? 
--!
--! 2: Create project in Quartis 
--!    Simulate the result
--!    Assign 'y' with the result of shift-left operation applied to 'a'
--! 
--! The following code represents the original assignemnt
--------------------------------------------------------------------
--LIBRARY ieee;
--USE ieee.std_logic_1164.all;
--------------------------------------------------------------------
--ENTITY question2 IS
--   PORT(
--      a, 
--      b: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
--      y: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
--   );
--END ENTITY;
--------------------------------------------------------------------
--ARCHITECTURE implementation OF question2 IS 
--   SIGNAL control: STD_LOGIC_VECTOR(3 DOWNTO 0);
--BEGIN
--   control <= a XOR b;
--   
--   PROCESS (a, b)
--   BEGIN
--   
--      CASE control IS
--         WHEN "0011" => y <= "0011";
--         WHEN "1100" => y <= "1100";
--         WHEN OTHERS => y <= control XNOR a;
--      END CASE;
--      
--   END PROCESS;
--   
--END ARCHITECTURE;
--------------------------------------------------------------------

--! The following code is modified to brin signal control outside for analysis. 
------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
------------------------------------------------------------------
ENTITY question2 IS
   PORT(
      a, 
      b: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      y: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      control: BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0)
   );
END ENTITY;
------------------------------------------------------------------
ARCHITECTURE implementation OF question2 IS 
--   SIGNAL control: STD_LOGIC_VECTOR(3 DOWNTO 0); -- moved to ENTITY
BEGIN
   control <= a XOR b;
   
   PROCESS (a, b)
   BEGIN
   
      CASE control IS
         WHEN "0011" => y <= "0011";
         WHEN "1100" => y <= "1100";
         WHEN OTHERS => y <= control XNOR a;
      END CASE;
      
   END PROCESS;
   
END ARCHITECTURE;
------------------------------------------------------------------
