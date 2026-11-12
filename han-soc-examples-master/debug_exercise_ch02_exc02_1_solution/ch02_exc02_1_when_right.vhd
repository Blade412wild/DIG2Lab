--------------------------------------------------------------------
-- Name of File:   ch02_exc02_1_when_right.vhd
-- Version/Date:   see top of 'Version History'
-- Description:   Exercize 2.1 of Pedroni 2nd Ed, page 20 using CASE
-- Author:         Remko Welling (remko.welling@han.nl)
-- Company:         HAN TF ELT/ESE Arnhem 
--
-- Version History:
-- Nr:      Date:         Author:      Remarks:
-- --------|-----------|-----------|-------------------------------
-- v01      20181003      WLGRW         Initial Version
-- v02      20210309    WLGRW       debug exercise
-- -----------------------------------------------------------------
-- Assignment: 
-- Identify all syntax errors in this project and correct them
--------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------------------------------
ENTITY ch02_exc02_1_when_right IS -- was "mux"
PORT (   a, b: IN  STD_LOGIC_VECTOR(7 DOWNTO 0);    -- 8 bits wide inputs
         sel : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);    -- 2 bits wide selection
         x   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));   -- 8 bits wide output
END ch02_exc02_1_when_right;
--------------------------------------------------------------------
ARCHITECTURE example OF ch02_exc02_1_when_right IS
BEGIN
   x <= "00000000"  WHEN sel = "00" ELSE
         a          WHEN sel = "01" ELSE
         b          WHEN sel = "10" ELSE
        "ZZZZZZZZ";
END example;
--------------------------------------------------------------------