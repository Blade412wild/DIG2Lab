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
--!        +----------+
--!        |          |
--!        |          |-----> LED 1 blinking at 1 second interval
--! clk -->|  Blinky  |
--!        |          |-----> LED 2 blinking at 0,5 second interval
--!        |          |
--!        +----------+
--! 
--! \endverbatim
--! 
--! This code was created using the tutorial at: https://www.ece.ucdavis.edu/~bbaas/180/tutorials/using.a.PLL.pdf
--! Note that in this tutorial verilog was used while here VHDL is used. 

------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
------------------------------------------------------------------
ENTITY blinky IS

   GENERIC (
      CLOCK_FREQUENCY_50:  INTEGER := 50000000;    --! 50 MHz clock frequency representative.
      CLOCK_FREQUENCY_100: INTEGER := 50000000    --! 100 MHz clock frequency representative.
   ); 
   
   PORT (
      MAX10_CLK1_50 : IN  STD_LOGIC;               --! 50 MHz clock on board the Cycone MAX 10 FPGA
      LEDR          : OUT STD_LOGIC_VECTOR(0 to 9) --! internal LEDs on De10-Lite board
   );
   
END ENTITY;
------------------------------------------------------------------
ARCHITECTURE helloWorld OF blinky IS
   SIGNAL internal_clock_1hz_50mhz  : STD_LOGIC := '0'; --! SIGNAL to keep internal clock.
   SIGNAL internal_clock_1hz_100mhz : STD_LOGIC := '0'; --! SIGNAL to keep internal clock.
   SIGNAL internal_pll_clock        : STD_LOGIC := '0'; --! SIGNAL to keep internal clock.
BEGIN

   pll_inst : work.pll PORT MAP (
      inclk0 => MAX10_CLK1_50,
      c0     => internal_pll_clock
   );
   
   clk_50_mhz : PROCESS(MAX10_CLK1_50)
      VARIABLE counter: INTEGER RANGE 0 TO CLOCK_FREQUENCY_50 := 0;
   BEGIN
   
      IF (rising_edge(MAX10_CLK1_50)) THEN
         
         counter := counter + 1;
         
         IF (counter = CLOCK_FREQUENCY_50) THEN
            counter := 0;
            internal_clock_1hz_50mhz <= NOT internal_clock_1hz_50mhz;
         END IF;
      
      END IF;
      
   END PROCESS;
   
   LEDR(0) <= internal_clock_1hz_50mhz;
   
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
