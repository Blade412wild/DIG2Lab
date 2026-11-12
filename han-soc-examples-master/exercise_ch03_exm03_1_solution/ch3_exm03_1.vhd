--------------------------------------------------------------------
--! \file      ch3_exm03_1.vhd
--! \date      see top of 'Version History'
--! \brief     Example 3.1 Pedroni 2nd Ed. pag.50
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
--! 001    |8-10-2018  |WLGRW   |Inital version
--!

--! Function description:
--! ---------------------
--! As already mentioned, a fundamental synthesizable value is 'Z' 
--! (high impedance), which is needed to create tri-state bu¤ers, 
--! like that depicted in figure 3.3 (see its truth table).
--!
--! \verbatim
--!  
--!          Tri-state Buffer
--!          +-----------+
--!  input ->|           |
--!          |           |
--!          |           |-> Output
--!          |           |
--! enable ->|           |
--!          +-----------+
--!
--! Figure 3.3
--!
--! \endverbatim
--!
--! Truth table
--! -----------
--!
--! enable | output
--! -------|-------
--! '0'    | 'Z'
--! '1'    | input
--!
--! Assignment:
--! -----------
--! Write a VHDL code from which this circuit can be inferred.
--!
--! Use the template project that is delivered with this project.
--! 
--! 1: Implement PORT objects required in ENTITY.
--! 2: Implement the logic for the Tri-state Buffer in ARCHITECTURE.
--! 3: Study the hardware that was synthesised using the RTL Viewer.
--! 4: Perform a functional simulation using Waveform analysis.
--! 5: Discuss your findings and observations in class. 


-- Template
----------------------------------------------------------------------
--LIBRARY ieee;
--USE ieee.std_logic_1164.all;
----------------------------------------------------------------------
--ENTITY ch3_exm03_1 IS -- Was "tri_state" in Pedroni example.
--PORT (
--      
--      -- Add here your PORT objects.
--      
--      );
--END ENTITY;
----------------------------------------------------------------------
--ARCHITECTURE tri_state OF ch3_exm03_1 IS
--BEGIN
--
--   -- Add here your implementation of the Tri-state Buffer
--   
--END ARCHITECTURE;
----------------------------------------------------------------------



-- Correct implementation
--------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------------------------------
ENTITY ch3_exm03_1 IS --! Was "tri_state"
PORT (
      input:  IN  STD_LOGIC;
      enable: IN  STD_LOGIC;
      output: OUT STD_LOGIC
      );
END ENTITY;
--------------------------------------------------------------------
ARCHITECTURE tri_state OF ch3_exm03_1 IS
BEGIN

   output <= input WHEN enable='1' ELSE 'Z';
   
END ARCHITECTURE;
--------------------------------------------------------------------
