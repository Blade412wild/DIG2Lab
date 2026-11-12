--------------------------------------------------------------------
--! \file      blinky.vhd
--! \date      see top of 'Version History'
--! \brief     Blink LEDR1 in a 1 second interval.
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
--! Hello world in VHDL. 
--! 
--! \verbatim
--!
--!        +----------+
--!        |          |
--!        |          |   
--! clk -->|  Blinky  |-----> LED blinking at 1 second interval
--!        |          |
--!        |          |
--!        +----------+
--! 
--! \endverbatim

------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
------------------------------------------------------------------
ENTITY blinky IS

   GENERIC (
      CLOCK_FREQUENCY: INTEGER := 50000000            --! 50 MHz clock frequency representative.
   ); 
   
   PORT (
      MAX10_CLK1_50 : IN  STD_LOGIC;                  --! 50 MHz clock on board the Cycone MAX 10 FPGA
      LEDR          : OUT STD_LOGIC_VECTOR(0 to 9)    --! internal LEDs on De10-Lite board
   );
   
END ENTITY;
------------------------------------------------------------------
ARCHITECTURE helloWorld OF blinky IS
   SIGNAL internal_clock : STD_LOGIC := '0';          --! SIGNAL to keep internal clock.
BEGIN

   PROCESS(MAX10_CLK1_50)
      VARIABLE counter: INTEGER RANGE 0 TO CLOCK_FREQUENCY := 0;
   BEGIN
   
      IF (rising_edge(MAX10_CLK1_50)) THEN
         
         counter := counter + 1;
         
         IF (counter = CLOCK_FREQUENCY) THEN
         
            counter := 0;
            internal_clock <= NOT internal_clock;
            
         END IF;
      
      END IF;
      
   END PROCESS;
   
   LEDR(0) <= internal_clock;
   
END ARCHITECTURE;
------------------------------------------------------------------
