--------------------------------------------------------------------
--! \file      example_4-bit_de-multiplexer.vhd
--! \date      see top of 'Version History'
--! \brief     example of 4-bit de-multiplexer
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
ENTITY demultiplexer IS

   PORT(
      selector : IN  STD_LOGIC_VECTOR(1 DOWNTO 0); --! 2-bit output selector
      input    : IN  STD_LOGIC;                    --! Input of demultiplexer
      output_0,                                    --! Output 1 of demultiplexer
      output_1,                                    --! Output 2 of demultiplexer
      output_2,                                    --! Output 3 of demultiplexer
      output_3 : OUT STD_LOGIC                     --! Output 4 of demultiplexer
   );

END demultiplexer;
--------------------------------------------------------------------
ARCHITECTURE implementation OF demultiplexer IS
BEGIN
   
   --! Selector of ouput_0 to output_3.
   output_0 <= input WHEN selector = "00" ELSE '0';
   output_1 <= input WHEN selector = "01" ELSE '0';
   output_2 <= input WHEN selector = "10" ELSE '0';
   output_3 <= input WHEN selector = "11" ELSE '0';
   
   
END implementation;
--------------------------------------------------------------------
