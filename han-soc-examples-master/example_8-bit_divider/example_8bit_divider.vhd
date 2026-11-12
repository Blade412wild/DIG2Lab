--------------------------------------------------------------------
--! \file      example_8bit_divider.vhd
--! \date      see top of 'Version History'
--! \brief     example of clock divider using ripple counter
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
--------------------------------------------------------------------
LIBRARY ieee;
USE  ieee.std_logic_1164.all;
USE  ieee.std_logic_arith.all;      -- needed for arithmetic increment
USE  ieee.std_logic_unsigned.all;
--------------------------------------------------------------------
ENTITY example_8bit_divider IS

   PORT(
      clock,                                             --! Clock in
      reset          : IN  STD_LOGIC;                    --! reset (negative logic)
      clkOutSelector : IN  STD_LOGIC_VECTOR(3 DOWNTO 0); --! divided clock output selector
      clkOut         : OUT STD_LOGIC;                    --! divided clock out
      count          : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)  --! Internal counter for debugging
   );

END example_8bit_divider;
--------------------------------------------------------------------
ARCHITECTURE countereightbit OF example_8bit_divider IS

   SIGNAL internalCounter: std_logic_vector(7 DOWNTO 0);

BEGIN
   count <= internalCounter;
  
   rippleCounter : PROCESS (reset, clock)
   BEGIN               
   
      IF reset = '0' THEN                          -- reset counter, negative logic
         internalCounter <= (OTHERS => '0'); 
      ELSIF rising_edge(clock) THEN                -- Check for maximum count
            internalCounter <= internalCounter + 1;-- Count >=  Max_Count so reset Counter
      END IF;
      
   END PROCESS;
   
   --! Selector of divided clock.
   WITH clkOutSelector SELECT
      clkOut <= internalCounter(0)  WHEN X"0", -- 0
                internalCounter(1)  WHEN X"1", -- 1
                internalCounter(2)  WHEN X"2", -- 2
                internalCounter(3)  WHEN X"3", -- 3
                internalCounter(4)  WHEN X"4", -- 4
                internalCounter(5)  WHEN X"5", -- 5
                internalCounter(6)  WHEN X"6", -- 6
                internalCounter(7)  WHEN X"7", -- 7
                '0' WHEN OTHERS;   -- off in all other cases
   
END countereightbit;
--------------------------------------------------------------------
