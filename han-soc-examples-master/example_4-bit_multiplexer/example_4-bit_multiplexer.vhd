--------------------------------------------------------------------
--! \file      example_4-bit_multiplexer.vhd
--! \date      see top of 'Version History'
--! \brief     example of 4-bit multiplexer
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |11-1-2021  |WLGRW   |Initial version for release
--!
--------------------------------------------------------------------
LIBRARY ieee;
USE  ieee.std_logic_1164.all;
--------------------------------------------------------------------
ENTITY multiplexer IS

   PORT(
      selector : IN  STD_LOGIC_VECTOR(1 DOWNTO 0); --! 2-bit output selector
      output   : OUT STD_LOGIC;                    --! Output of multiplexer
      input_0,                                     --! Input 1 of multiplexer
      input_1,                                     --! Input 2 of multiplexer
      input_2,                                     --! Input 3 of multiplexer
      input_3  : IN  STD_LOGIC                     --! Input 4 of multiplexer
   );

END multiplexer;
--------------------------------------------------------------------
--ARCHITECTURE implementation OF multiplexer IS
--BEGIN
--   
--   --! Selector of input_0 to input_3.
--   WITH selector SELECT
--      output <= input_0  WHEN "00",   -- input 0 
--                input_1  WHEN "01",   -- input 1 
--                input_2  WHEN "10",   -- input 2 
--                input_3  WHEN "11",   -- input 3 
--                '0'      WHEN OTHERS; -- off in all other cases
--   
--END implementation;
--------------------------------------------------------------------
ARCHITECTURE implementation OF multiplexer IS
BEGIN
   
   --! Selector of input_0 to input_3.
	output <= input_0  WHEN selector = "00" ELSE   -- input 0 
				 input_1  WHEN selector = "01" ELSE   -- input 1 
				 input_2  WHEN selector = "10" ELSE   -- input 2 
				 input_3  WHEN selector = "11";       -- input 3 
				 
   
END implementation;
--------------------------------------------------------------------

