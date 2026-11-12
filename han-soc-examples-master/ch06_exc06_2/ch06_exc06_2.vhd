--------------------------------------------------------------------
--! \file      ch06_exc06_2.vhd
--! \date      see top of 'Version History'
--! \brief     Excercise 6.2 of Pedroni 2nd Ed, page 158.
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |8-4-2021   | WLGRW  | Initial Version
--!
--! Assignment:
--! -----------
--! Design a 0-to-max counter with gray-encoded outputs. Enter MAX as a generic parameter.
--!
--! Function description:
--! ---------------------
--! Example 6.2: Basic Counter of Pedroni 2nd Ed, page 157.
--!
--! Figure 1 shows, a diagram for a regular gray counter.
--! A single clock signal goes in and at the output 4 bits exit carrying
--! a a gray coded counting signal that increments at each clock and counts MAX.
--! 
--! \verbatim
--!
--!        +----------+
--!        |          |
--!        |          |   3
--! clk -->| Gray-    |--/--> gray (3:0)
--!        |  counter |
--!        |          |
--!        +----------+
--! 
--! Figure 1
--! 
--! \endverbatim
--!
--! Inspiration
--! -----------
--! - http://www.asic-world.com/examples/vhdl/gray.html
------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
------------------------------------------------------------------
ENTITY ch06_exc06_2 IS
   
   GENERIC (
      N:   INTEGER := 3; -- number of bits
      MAX: INTEGER := 10 -- make shure it fits N!
   );
   
   PORT (
      clk:  IN    STD_LOGIC;
      gray: OUT   STD_LOGIC_VECTOR(N DOWNTO 0)
   );
   
END ENTITY;
------------------------------------------------------------------
ARCHITECTURE counter OF ch06_exc06_2 IS
   SIGNAL binCount: STD_LOGIC_VECTOR (N DOWNTO 0);
BEGIN
   
   PROCESS(clk)
      VARIABLE temp: INTEGER RANGE 0 TO MAX := 0;
   BEGIN
   
      IF (clk'EVENT AND clk='1') THEN
      
         temp := temp + 1;
         
         IF (temp = MAX) THEN
            temp := 0;
         END IF;
         
      END IF;
   
      binCount <= conv_std_logic_vector(temp, N+1); -- Pedroni page 76
   
   END PROCESS;
   
   gray(N-1) <= binCount(N-1);
   
   gen: FOR i IN 0 TO N-2 GENERATE 
      gray(i) <= binCount(i+1) XOR binCount(i);
   END GENERATE;
   
   
END ARCHITECTURE;
------------------------------------------------------------------
