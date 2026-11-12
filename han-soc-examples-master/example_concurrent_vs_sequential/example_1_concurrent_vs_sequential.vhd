--------------------------------------------------------------------
--! \file      example_1_concurrent_vs_sequential.vhd
--! \date      see top of 'Version History'
--! \brief     example of sequential and concurrent logic
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |12-5-2020  |WLGRW   |Initial version for release
--!
--------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
--------------------------------------------------------------------
ENTITY example_1_concurrent_vs_sequential IS
   PORT ( 
      a,
      b,
      c,
      d    : IN  STD_LOGIC;
      sel  : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
      out1 : OUT STD_LOGIC
   );
END example_1_concurrent_vs_sequential;
--------------------------------------------------------------------
--! Select here the architecture for compilation by uncommenting the architecture:
--! uncomment "FOR <ARCHITECTURE>" to select the ARCHITECTURE

CONFIGURATION which_architecture OF example_1_concurrent_vs_sequential IS
--   FOR sequential_if_then     				   --! SEQUENTIAL logic using IF THEN
   FOR sequential_switch_case 					--! SEQUENTIAL logic using SWITCH-CASE
--   FOR concurrent_if_then_inferred_latch   --! CONCURRENT logic using IF-THEN
--   FOR concurrent_if_then                  --! CONCURRENT logic using IF-THEN
--   FOR concurrent_switch_case              --! CONCURRENT logic using SWITCH-CASE
   END FOR;
END CONFIGURATION;
--------------------------------------------------------------------
ARCHITECTURE sequential_if_then OF example_1_concurrent_vs_sequential IS

BEGIN

   PROCESS(a, b, c, d, sel)
   
   BEGIN
   
      IF sel="00" THEN
         out1 <= a;
      ELSIF sel="01" THEN
         out1 <= b;
      ELSIF sel="10" THEN
         out1 <= c;
      ELSE
         out1 <= d;
      END IF;
      
   END PROCESS;

END sequential_if_then;
--------------------------------------------------------------------
ARCHITECTURE sequential_switch_case OF example_1_concurrent_vs_sequential IS

BEGIN

   PROCESS(a, b, c, d, sel)
   
   BEGIN
   
      CASE sel IS
         WHEN "00" =>
            out1 <= a;
         WHEN "01" =>
            out1 <= b;
         WHEN "10" =>
            out1 <= c;
         WHEN OTHERS =>
            out1 <= d;
      END CASE;
      
   END PROCESS;

END sequential_switch_case;
--------------------------------------------------------------------
ARCHITECTURE concurrent_if_then_inferred_latch OF example_1_concurrent_vs_sequential IS

BEGIN

   out1 <= a WHEN sel="00" ELSE
           b WHEN sel="01" ELSE
           c WHEN sel="10" ELSE
           d WHEN sel="11";

END concurrent_if_then_inferred_latch;
--------------------------------------------------------------------
ARCHITECTURE concurrent_if_then OF example_1_concurrent_vs_sequential IS

BEGIN

   out1 <= a WHEN sel="00" ELSE
           b WHEN sel="01" ELSE
           c WHEN sel="10" ELSE
           d ;

END concurrent_if_then;
--------------------------------------------------------------------
ARCHITECTURE concurrent_switch_case OF example_1_concurrent_vs_sequential IS

BEGIN

   WITH sel SELECT
      out1 <= a WHEN "00",
              b WHEN "01",
              c WHEN "10",
              d WHEN OTHERS;

END concurrent_switch_case;
--------------------------------------------------------------------
