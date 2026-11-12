--------------------------------------------------------------------
--! \file      test_shift.vhd
--! \date      see top of 'Version History'
--! \brief     Example 5.2 of Pedroni 2nd Ed, page 125.
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |20-12-2019 |WLGRW   |Update for MAX10
--!
--! Comments: 
--! -- 1: none

--! Assignment:
--! -----------
--! 
--! 1: Assign 'y' with the result of shift-left operation applied to 'a'
--!    while using function "SLL" in architecture one
--! 2: Assign 'y' with the result of shift-left operation applied to 'a'
--!    while using the concatenation operator (&)
--! 
--! Using this code:
--! ----------------
--! - This code is using CONFIGURATION to select the architecture.


--================================================================
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
------------------------------------------------------------------
ENTITY test_shift IS
   GENERIC ( 
            N: INTEGER := 8 --word bits
           );
   PORT (   a: IN    STD_LOGIC_VECTOR(N-1 DOWNTO 0);
            y: OUT   STD_LOGIC_VECTOR(N-1 DOWNTO 0)
         );
END ENTITY;
------------------------------------------------------------------
--! Configuration selector. Selects ARCHITECTURE for a solution.
--! uncomment the architecture you want to use/compile.
------------------------------------------------------------------
CONFIGURATION which_mux OF test_shift IS
--   FOR ONE   -- uncomment to select architecture ONE
   FOR TWO   -- uncomment  to select architecture TWO
   END FOR;
END CONFIGURATION;
------------------------------------------------------------------
ARCHITECTURE one OF test_shift IS
   SIGNAL a_logic:   UNSIGNED(N-1 DOWNTO 0);
   SIGNAL y_logic:   UNSIGNED(N-1 DOWNTO 0);
BEGIN

--! Implement here the VHDL code that will assign 'y' with the 
--! result of shift-left operation applied to 'a' while using 
--! the function "SLL".






END ARCHITECTURE;
------------------------------------------------------------------
ARCHITECTURE two OF test_shift IS

BEGIN

--! Implement here the VHDL code that will assign 'y' with the 
--! result of shift-left operation applied to 'a' while using 
--! the concatenation operator (&)







END ARCHITECTURE;
------------------------------------------------------------------
