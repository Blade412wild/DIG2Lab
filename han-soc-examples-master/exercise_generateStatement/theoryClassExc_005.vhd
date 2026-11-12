--------------------------------------------------------------------
--! \file      theoryClassExc_005.vhd
--! \date      see top of 'Version History'
--! \brief     Theroy exercise using GENERATE.
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN AEA ESE 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |13-12-2019 |WLGRW   |Added architecture switch
--! 002    |16-12-2024 |WLGRW	  |Removed architecture switch
--!

--! Function description:
--! ---------------------
--! Below, three signals are declared, then three equivalent sections of code utilizing
--! the GENERATE statement are presented. In all three the label is gen, the identifier is i,
--! and the range is 0-to-7 or 7-downto-0.
--!
--! Assignment:
--! -----------
--! 1- Study the example in Pedroni 2nd Ed, page 130.
--! 2- Compile the code with ARCH1 selected and inspect
--!    Hardware compiled
--! 3- Add to ARCH2 the VHDL code that representes the same hardware as
--!    generated with ARCH1 
--! 4- Compile the code with ARCH2 selected and inspect
--!    Hardware compiled
--! 5- Answer the question: how does GENERATE work?
--!
--! Extra assignment:
--! -----------
--! 6- Add to ARCH2 the VHDL code that representes the same hardware
--!    as generated with example 2 and 3.
--! 7- Compile the code with ARCH2 selected and inspect
--!    Hardware compiled


------------------------------------------------------------------
--! Include libraries
LIBRARY ieee;
USE ieee.std_logic_1164.all;
------------------------------------------------------------------
ENTITY theoryClassExc_005 IS                 -- Was "signed_multiplier"
PORT (
      a:    IN    STD_LOGIC_VECTOR(7 DOWNTO 0);
      b:    IN    STD_LOGIC_VECTOR(7 DOWNTO 0);
      x:    OUT   STD_LOGIC_VECTOR(7 DOWNTO 0)
     );
END ENTITY;
------------------------------------------------------------------
--! Select the ARCHITECTURE for a solution by uncommenting
--! the architecture you want to use/compile.
------------------------------------------------------------------
ARCHITECTURE arch1 OF theoryClassExc_005 IS
--   SIGNAL a, b, x: BIT_VECTOR(7 DOWNTO 0);
BEGIN

--   -- example 1 ----------------------------------
   gen: FOR i IN 0 TO 7 GENERATE
      x(i) <= a(i) XOR b(7-i);
   END GENERATE;
   
   -- example 2 ----------------------------------
--   gen: FOR i IN a'RANGE GENERATE
--      x(i) <= a(i) XOR b(7-i);
--   END GENERATE;

   -- example 3 ----------------------------------
--   gen: FOR i IN a'REVERSE_RANGE GENERATE
--      x(i) <= a(i) XOR b(7-i);
--   END GENERATE;
   -----------------------------------------------

END arch1;
---------------------------------------
--ARCHITECTURE arch2 OF theoryClassExc_005 IS
----   SIGNAL a, b, x: BIT_VECTOR(7 DOWNTO 0);
--BEGIN
--
----   Add here code that produces the same hardware
--
--END arch2;

------------------------------------------------------------------

