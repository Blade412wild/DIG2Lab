--------------------------------------------------------------------
--! \file      ch06_exm06_2.vhd
--! \date      see top of 'Version History'
--! \brief     Example 6.5 of Pedroni 2nd Ed, page 158.
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |26-10-2018 | WLGRW  | Initial Version
--! 002    |26-10-2018 | WLGRW  | Adapted for simulation
--! 003    |13-12-2019 | WLGRW  | Version for MAX10 and as exercise in class
--!

--! Function description:
--! ---------------------
--! Example 6.2: Basic Counter of Pedroni 2nd Ed, page 157.
--!
--! Figure 6.4 shows, a diagram for a regular binary 0-to-9 counter.
--! A single clock signal goes in and at the output 4 bits exit carrying
--! a counting signal that increments at each clock and counts to 10.
--! At 10 the signal is set to 0 and starts counting again.
--! 
--! \verbatim
--!
--!        +----------+
--!        |          |
--!        |  0-to-9  |   3
--! clk -->| counter  |--/--> count (3:0))
--!        |          |
--!        |          |
--!        +----------+
--! 
--! Figure 6.4
--! 
--! \endverbatim
--!
--! Assignment:
--! -----------
--! Write a VHDL code that implements this circuit.
--!

------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
------------------------------------------------------------------
ENTITY ch06_exm06_2 IS
   GENERIC (
      N:            INTEGER := 3; -- number of bits
      COUNT_TARGET: INTEGER := 10 -- make shure it fits N
   ); 
   PORT (
      clk:   IN     STD_LOGIC;
      count: OUT    STD_LOGIC_VECTOR(N DOWNTO 0)
   );
END ENTITY;
------------------------------------------------------------------
ARCHITECTURE counter OF ch06_exm06_2 IS
BEGIN
   PROCESS(clk)
      VARIABLE temp: INTEGER RANGE 0 TO COUNT_TARGET;
   BEGIN
   
   IF (clk'EVENT AND clk='1') THEN
      temp := temp + 1;
      
      IF (temp=COUNT_TARGET) THEN
         temp := 0;
      END IF;
   END IF;
   
   count <= conv_std_logic_vector(temp, N+1); -- Pedroni page 76
   
   END PROCESS;
END ARCHITECTURE;
------------------------------------------------------------------



--------------------------------------------------------------------
--LIBRARY ieee;
--USE ieee.std_logic_1164.all;
--USE ieee.std_logic_arith.all;
--------------------------------------------------------------------
--ENTITY ch06_exm06_2 IS
--   GENERIC (
--      -- use a GENERIC (N) for the output VECTOR
--      -- use a GENERIC for the 
--   ); 
--   PORT (
--      clk:   IN     STD_LOGIC;
--      count: OUT    STD_LOGIC_VECTOR(N DOWNTO 0)
--   );
--END ENTITY;
--------------------------------------------------------------------
--ARCHITECTURE counter OF ch06_exm06_2 IS
--BEGIN
--   -- Start PROCESS and populate sensitivity list
--      -- declare a INTEGER variable able to hold the maximum value of 10
--   BEGIN
--   
--   -- Test for rising edge using IF
--      -- Increment counter because rsing-edge is detected.
--      
--      -- Test if counter reached the value of 10 using IF
--         -- Reset counter to 0
--      END IF;
--   END IF;
--   
--   -- typecast INTEGRE Variable to STD_LOGIC_VECTOR, see Pedroni page 76
--   
--   END PROCESS;
--END ARCHITECTURE;
--------------------------------------------------------------------
