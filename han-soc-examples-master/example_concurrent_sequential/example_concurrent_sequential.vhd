--------------------------------------------------------------------
--! \file      example_concurrent_sequential.vhd
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
--! 001    |16-3-2021  |WLGRW   |Initial version for release
--!
--------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
--------------------------------------------------------------------
ENTITY example_concurrent_sequential IS
   PORT ( 
      a,
      b,
      clk    : IN  STD_LOGIC;
      output : OUT STD_LOGIC
   );
END example_concurrent_sequential;
--------------------------------------------------------------------
ARCHITECTURE behavioural OF example_concurrent_sequential IS
   SIGNAL c, 
          d : STD_LOGIC := '0';
BEGIN

   c      <= a XOR b;
   output <= NOT (NOT d); -- NOT because of negative logic LED

   PROCESS(Clk)
   BEGIN 
      IF(rising_edge(Clk)) THEN
         d <= c; 
      END IF;
   END PROCESS;  

END behavioural;
--------------------------------------------------------------------
