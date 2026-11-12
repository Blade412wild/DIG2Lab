--------------------------------------------------------------------
--! \file      twentyFiveProcDutycycleClock.vhd
--! \date      see top of 'Version History'
--! \brief     A clock generator that generates a clock signal with a duty cycle of 50%.
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |25-5-2021  | WLGRW  | Initial Version
--!
--! Function description:
--! ---------------------
--! 
--! \verbatim
--!
--!        +-----------+
--!        |           |
--!        |   pulse   |   
--! clk -->| generator |-----> signal with a 25% duty cycle
--!        |           |
--!        |           |
--!        +-----------+
--! 
--! \endverbatim

------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
------------------------------------------------------------------
ENTITY twentyFiveProcDutycycleClock IS

   GENERIC (
      T:     INTEGER := 4; -- 
      PULSE: INTEGER := 1  -- 
   ); 
   
   PORT (
      clk_in:  IN  STD_LOGIC;
      clk_out: OUT STD_LOGIC
   );
END ENTITY;
------------------------------------------------------------------
ARCHITECTURE counter OF twentyFiveProcDutycycleClock IS
   
BEGIN

   PROCESS(clk_in)
      VARIABLE counter: INTEGER RANGE 0 TO T;
   BEGIN
   
      IF (rising_edge(clk_in)) THEN
         
         counter := counter + 1;
         
         IF (counter=T) THEN
         
            counter := 0;
            clk_out <= '1';
            
         ELSIF (counter = PULSE) THEN

            clk_out <= '0';

         END IF;
      
      END IF;
      
   END PROCESS;
   
END ARCHITECTURE;
------------------------------------------------------------------
