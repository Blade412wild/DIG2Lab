--------------------------------------------------------------------
--! \file      lfsr1.vhd
--! \date      See top of 'Version History'
--! \brief     PRBS generator 
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |1-6-2021   |WLGRW   |Inital version
--!
--! Function description
--! --------------------
--!
--! This code was copied from: https://semiwiki.com/fpga/6129-pseudo-random-generator-tutorial-in-vhdl-part-1-3/
--!
--! This architecture will generate random numbers. One popular way of generating pseudo-random numbers 
--! in HW is by means of an LFSR. LFSR stands for Linear-Feedback Shift Register.
--! 
--! The input bit to the shift register of the LFSR is a linear function of its previous value. 
--! The theory used to generate these sequences is based on linear algebra, where the register is 
--! interpreted as a polynomial. Each bit in the register is the coefficient of order ‘n’ of such a polynomial.
--! 
--! A register of length n can generate a pseudo-random sequence of maximum length 2[SUP]n[/SUP]-1. 
--! There are ‘recipes’ for the linear feedback function needed to generate maximum length sequences 
--! for any register length. See the references at the end of the article for more details.
--! 
--! So let’s see our first version of a pseudo-random generator written in VHDL.
--! For this first example, the polynomial order is very low, i.e. 3 (the shift register has 4 bits), 
--! which generates an optimum sequence consisting of 15 values. When we simulate the LFSR, if we keep
--! running the simulation, these 15-values pseudo-random sequence will repeat indefinitely.
--! 
--! That is the reason that these sequences are called pseudo-random. They have a certain variability,
--! but on the other hand, they are repetitive, and even if they are not a trivial sequence, they 
--! always will be the same sequence. After the number ‘3’ in this sequence, we will always get the 
--! number ‘7’. Of course a real random number does not behave in this way. But we will see later 
--! that even with this limitation, pseudo-number sequences can approximate quite well the behavior of white noise.
------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------------------------------------------------------
ENTITY lfsr1 IS

   GENERIC (
      N: INTEGER := 14
   );
   
   port (
      reset : IN  std_logic;
      clk   : IN  std_logic;
      count : OUT std_logic_vector (N DOWNTO 0) -- lfsr output
   );
END ENTITY;
------------------------------------------------------------------------------
ARCHITECTURE rtl OF lfsr1 IS
   SIGNAL count_i  : std_logic_vector (N DOWNTO 0);
   SIGNAL feedback : std_logic;

begin

   feedback <= NOT(count_i(N) XOR count_i(N-1)); -- lfsr size 4

   PROCESS (reset, clk)
   BEGIN
   
      IF (reset = '0') THEN
         count_i <= (OTHERS => '0');
      ELSIF (rising_edge(clk)) THEN
         count_i <= count_i(N-1 DOWNTO 0) & feedback;
      END IF;
      
   END PROCESS;
   
   count <= count_i;

END ARCHITECTURE;
------------------------------------------------------------------------------
