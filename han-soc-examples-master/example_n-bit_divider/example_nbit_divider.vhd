--------------------------------------------------------------------
--! \file      example_nbit_divider.vhd
--! \date      see top of 'Version History'
--! \brief     clock divider with variable factor n
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
--! A n-bit clock divider that is limited to max_count.
--! devision factor is from 1 to 1/n where n is limited to 255.
--!
---------------------------------------------------------------------
LIBRARY ieee;
USE  ieee.std_logic_1164.all;
USE  ieee.std_logic_arith.all;      -- needed for arithmetic increment
USE  ieee.std_logic_unsigned.all;
--------------------------------------------------------------------
ENTITY example_nbit_divider IS

   PORT(
      clock,
      reset     : IN  STD_LOGIC;
      max_count : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
      clkOut    : OUT STD_LOGIC;                    --! divided clock out
      count     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
   );

END example_nbit_divider;
--------------------------------------------------------------------
ARCHITECTURE nbitcounter OF example_nbit_divider IS

   SIGNAL internalCounter: STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL internalClock  : STD_LOGIC := '0';

BEGIN
   count <= internalCounter;
   clkOut <= internalClock;
  
   PROCESS (Reset,Clock)
   BEGIN               
   
      IF reset = '0' THEN                           --! reset counter, negative logic
         internalCounter <= (OTHERS => '0');
         internalClock <= '0';
      ELSIF rising_edge(clock) THEN                    --! Check for maximum count
      
         IF internalCounter < Max_count THEN        --! Increment Counter
            internalCounter <= internalCounter + 1; --! Count >=  Max_Count so reset Counter
         ELSE            
            internalClock <= NOT internalClock;     --! Toggle clock
            internalCounter <= (OTHERS => '0');
         END IF;

      END IF;
      
   END PROCESS;
   
END nbitcounter;
--------------------------------------------------------------------
