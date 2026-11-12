--------------------------------------------------------------------
--! \file      ch03_exm03_2.vhd
--! \date      see top of 'Version History'
--! \brief     Example 2.4 of Pedroni 2nd Ed, page 23.
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 002    |25-11-2019 |WLGRW   |modified in to template for class
--!        |           |        |Modified project for use with DE10_Lite
--!        |           |        |using MAX10 10M50DAF484C7G
--! 001    |4-10-2018  |WLGRW   |Inital version
--!
--! Comments: 
--! 1: Because "STD_LOGIC_VECTOR" is used the in- and outputs can
--!    more than two values! 
--! 2: This example also shows the result of the boolean logic that
--!    was derived from the Karnaugh diagrams.

--! Function description:
--! ---------------------
--! Figure 3.4a depicts a circuit whose input (x) and output (y) are 2-bit 
--! signals for which two sets of specifications are given in the truth 
--! table. In the former, all outputs are specified with '0's and '1's, 
--! while in the latter there is a "don’t care" output (y = "--"). 
--!
--! \verbatim
--!  
--!  Circuit with "don’t care" outputs
--!           +-----------+
--!           |           |
--!           |           |
--!  x(1:0) ->|           |-> y(1:0)
--!           |           |
--!           |           |
--!           +-----------+
--!
--! Figure 3.4
--!
--! \endverbatim
--!
--! Truth table
--! -----------
--!
--!  x1 | x2 | y1 | y0
--! ----|----|----|---
--!   0 | 0  | 0  | 0
--!   0 | 1  | 1  | 0
--!   1 | 0  | 0  | 1
--!   1 | 1  | -  | -
--!
--! Assignment:
--! -----------
--! Design this circuit by hand, then write a VHDL code for each truth-
--! table and observe the consequences of employing the logic value 
--! '-' in the code.
--!
--! Use the template project that is delivered with this project.
--! 
--! 1: Obtain the optimal equations for y using k-map.
--! 2: Implement PORT objects required in ENTITY.
--! 3: Implement the logic for the Circuit with "don’t care" outputs in ARCHITECTURE.
--! 4: Study the hardware that was synthesised using the RTL Viewer.
--! 5: Perform a functional simulation using Waveform analysis.
--! 6: Discuss your findings and observations in class. 


-- Template
------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
------------------------------------------------------------------
ENTITY ch03_exm03_2 IS
PORT (   

      -- Add here your PORT objects.
      
     );
END ENTITY;
------------------------------------------------------------------
ARCHITECTURE circuit OF ch03_exm03_2 IS
BEGIN

   -- Add here your implementation of the Circuit with "don’t care" outputs
   
END ARCHITECTURE;
------------------------------------------------------------------
