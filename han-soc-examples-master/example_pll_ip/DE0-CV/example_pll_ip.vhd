--------------------------------------------------------------------
--! \file      example_pll_ip.vhd
--! \date      see top of 'Version History'
--! \brief     Blink LEDR1 at 1 1Hz and LEDR2 at 2 Hz
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN AEA-ESE
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |25-5-2021  | WLGRW  | Initial Version of generic blinky: https://gitlab.com/wlgrw/han-soc-examples/-/tree/master/blinky
--! 001    |25-11-2022 | WLGRW  | Added PLL IP as Proof of concept.
--!
--! Function description:
--! ---------------------
--! Hello world in VHDL adapted to demonstrate PLL-IP. 
--! 
--! This design has 2 clock deviders implemented with different sources. 
--! Source 1 is the generick 50 MHz clock that is available in the DE10-Lite board.
--! Source 2 is the 100 MHz clock that is generated through a PLL that is available in the MAX10 FPGA. 
--! 
--! To demonstrate that both leds are controlled form a differente frequency source the clock devider is
--! counting to 50000000. as a result of this, the frequency of LEDR2 will be double compared by LEDR2.
--! 
--! to make both LEDs blink the same speed CLOCK_FREQUENCY_100 shall be set to 100000000.
--! 
--! \verbatim
--! 
--! Figure 1: Input- output diagram.
--! 
--!          +----------+
--!          |          |
--!   clk -->|          |-----> LED 1 blinking at 1 second interval
--!          |  Blinky  |
--! reset -->|          |-----> LED 2 blinking at 0,5 second interval
--!          |          |
--!          +----------+
--! 
--! \endverbatim
--! 
--! This code was created using the tutorial at: https://www.ece.ucdavis.edu/~bbaas/180/tutorials/using.a.PLL.pdf
--! Note that in this tutorial verilog was used while here VHDL is used. 
--!
--! \verbatim
--!
--! Figure 2: Layout DE0-CV.                                              GPIO 0  GPIO 1
--!                                                                        +---+  +---+
--!      DE0-CV KEY, SW, LED, and HEX layout                               |. .|  |1 2| 
--!                                                                        |. .|  |3 .|
--!                                                                        |. .|  |. .|
--!               7-segment displays (HEX)                                 |. .|  |. .|
--!              +---+---+---+---+---+---+                                 |. .|  |. .|
--!              |   |   |   |   |   |   |                                 |. .|  |.10|
--!              |   |   |   |   |   |   |                                 |. .|  |11.| Pin 11 <- GND
--!              |   |   | 8.| 8.| 8.| 8.|                                 |. .|  |. .|
--!              |   |   |   |   |   |   |                                 |. .|  |. .|
--!              |   |   |   |   |   |   |                                 |. .|  |. .|
--!              +---+---+---+---+---+---+                                ==============
--!                5   4   3   2   1   0                                   |. .|  |. .|
--!                                                                        |. .|  |. .|
--!      Number =>  9 8 7 6 5 4 3 2 1 0                                    |. .|  |. .|
--!                +-+-+-+-+-+-+-+-+-+-+                                   |. .|  |. .|
--! Leds (LEDR) => | | | | | | | | |A|B|                                   |. .|  |. .|
--!                +-+-+-+-+-+-+-+-+-+-+                                   |. .|  |. .|
--!                                                                        |. .|  |. .|
--!                +-+-+-+-+-+-+-+-+-+-+                                   |. .|  |. .|
--!                | | | | | | | | | | |   +--+--+--+--+  +--+             +---+  +---+
--!                +-+-+-+-+-+-+-+-+-+-+   |  |  |  |##|  |  |  <= KEY
--! Switch (SW) => | | | | | | | | | | |   +--+--+--+--+  +--+  
--!                +-+-+-+-+-+-+-+-+-+-+    3  2  1  0     4    <= Number
--!      Number =>  9 8 7 6 5 4 3 2 1 0              ^
--!                                                  |
--!                                                Reset
--! \endverbatim
--!
--! Functions:
--! - LEDR0: blinky from 50 MHz clock
--! - LEDR1: blinky from 100 MHz pll-clock
--! - KEY(0) pressed: RESET pll.
--!
--!

------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
------------------------------------------------------------------
ENTITY blinky IS

   GENERIC (
      CLOCK_FREQUENCY_50:  INTEGER := 50000000;   --! 50 MHz clock frequency representative.
      CLOCK_FREQUENCY_100: INTEGER := 50000000    --! 100 MHz clock frequency representative.
   ); 
   
   PORT (
      CLOCK_50 : IN  STD_LOGIC;                --! 50 MHz clock on board the Cycone MAX 10 FPGA
      LEDR     : OUT STD_LOGIC_VECTOR(0 TO 9); --! internal LEDs on De10-Lite board
      KEY      : IN  STD_LOGIC_VECTOR(0 TO 4)  --! Pushbuttons KEY0 to 4
   );
   
END ENTITY;
------------------------------------------------------------------
ARCHITECTURE helloWorld OF blinky IS
   SIGNAL internal_clock_1hz_50mhz  : STD_LOGIC := '0'; --! SIGNAL to keep internal 1 Hz clock from 50 MHz.
   SIGNAL internal_clock_1hz_100mhz : STD_LOGIC := '0'; --! SIGNAL to keep internal 1 Hz clock from 1000 MHz.
   SIGNAL internal_pll_clock        : STD_LOGIC := '0'; --! SIGNAL to keep internal 100 MHz clock from PLL.
   SIGNAL pll_rst                   : STD_LOGIC := '1'; --! SIGNAL to keep internal reset signal for PLL.
BEGIN

   clk_50_mhz : PROCESS(CLOCK_50)
      VARIABLE counter: INTEGER RANGE 0 TO CLOCK_FREQUENCY_50 := 0;
   BEGIN
   
      IF (rising_edge(CLOCK_50)) THEN
         
         counter := counter + 1;
         
         IF (counter = CLOCK_FREQUENCY_50) THEN
            counter := 0;
            internal_clock_1hz_50mhz <= NOT internal_clock_1hz_50mhz;
         END IF;
      
      END IF;
      
   END PROCESS;
   
   LEDR(0) <= internal_clock_1hz_50mhz;
   
   pll_rst <= NOT KEY(0); -- Reverse logic input. "Pressed"is reset.

   pll_inst : work.pll PORT MAP(
      refclk   => CLOCK_50,            --  refclk.clk
      rst      => pll_rst,             --   reset.reset
      outclk_0 => internal_pll_clock  -- outclk0.clk
   );
   
   clk_100_mhz : PROCESS(internal_pll_clock)
      VARIABLE counter: INTEGER RANGE 0 TO CLOCK_FREQUENCY_100 := 0;
   BEGIN
   
      IF (rising_edge(internal_pll_clock)) THEN
         
         counter := counter + 1;
         
         IF (counter = CLOCK_FREQUENCY_100) THEN
            counter := 0;
            internal_clock_1hz_100mhz <= NOT internal_clock_1hz_100mhz;
         END IF;
      
      END IF;
      
   END PROCESS;
   
   LEDR(1) <= internal_clock_1hz_100mhz;
   
END ARCHITECTURE;
------------------------------------------------------------------
