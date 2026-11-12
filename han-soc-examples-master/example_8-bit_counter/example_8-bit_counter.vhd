--------------------------------------------------------------------
--! \file      example_8-bit_counter.vhd
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
--! 001    |19-5-2020  |WLGRW   |Initial version for release
--!
--! # Description
--! A 8-bit counter that is limited to max_count.
--!
--!
--------------------------------------------------------------------
LIBRARY ieee;
USE  ieee.std_logic_1164.all;
USE  ieee.std_logic_arith.all;      -- needed for arithmetic increment
USE  ieee.std_logic_unsigned.all;
--------------------------------------------------------------------
ENTITY example_8bit_counter IS

   PORT(
      clock,
      reset     : IN  STD_LOGIC;
      max_count : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
      count     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
   );

END example_8bit_counter;
--------------------------------------------------------------------
ARCHITECTURE countereightbit OF example_8bit_counter IS

   SIGNAL internalCounter: std_logic_vector(7 DOWNTO 0);

BEGIN
   count <= internalCounter;
  
   PROCESS (Reset,Clock)
   BEGIN               
   
      IF reset = '0' THEN                          --! reset counter, negative logic
         internalCounter <= (OTHERS => '0'); 
      ELSIF rising_edge(clock) THEN                --! Check for maximum count
      
         IF internalCounter < Max_count THEN       --! Increment Counter
            internalCounter <= internalCounter + 1;--! Count >=  Max_Count so reset Counter
         ELSE            
            internalCounter <= (OTHERS => '0');
         END IF;

      END IF;
      
   END PROCESS;
   
END countereightbit;
--------------------------------------------------------------------
