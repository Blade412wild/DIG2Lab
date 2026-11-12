--------------------------------------------------------------------
-- Name of File:  ch04_exm04_4.vhd
-- Version/Date:  see top of 'Version History'
-- Description:   Example 4.2 of Pedroni 2nd Ed, page 109.
-- Author:        Remko Welling (remko.welling@han.nl)
-- Company:       HAN TF ELT/ESE Arnhem 
--
-- Version History:
-- Nr:      Date:       Author:     Remarks:
--+--------+-----------+-----------+------------------------------
-- v01      20181022    WLGRW       Initial Version
--================================================================
-- Comments: 
-- 1: This implementation is using ATTRIBUTE KEEP to prevent 
--    optimisation of synthesis. As a result the logic is kept and 
--    will introduce delay trough the logic.
------------------------------------------------------------------
--library std;
--use std.standard.all;
------------------------------------------------------------------
--ENTITY ch04_exm04_4 IS
--PORT (x: IN BIT;
--      y: OUT BIT);
--END ENTITY;
------------------------------------------------------------------
--ARCHITECTURE delay_line OF ch04_exm04_4 IS
--   SIGNAL    a:    BIT;
--   SIGNAL    b:    BIT;
--   SIGNAL    c:    BIT;
--   ATTRIBUTE keep: BOOLEAN;
--   ATTRIBUTE keep OF a, b, c: SIGNAL IS TRUE;
--BEGIN
--   a <= NOT x;
--   b <= NOT a;
--   c <= NOT b;
--   y <= NOT c;
--END ARCHITECTURE;
--================================================================
-- Comments: 
-- 2: This implementation is not using ATTRIBUTE KEEP to prevent 
--    optimisation of synthesis. The result of this VHDL code is
--    a simple connection. Here delay trough the logic is "lost".
------------------------------------------------------------------
--library std;
--use std.standard.all;
------------------------------------------------------------------
--ENTITY ch04_exm04_4 IS
--PORT (x: IN BIT;
--      y: OUT BIT);
--END ENTITY;
------------------------------------------------------------------
--ARCHITECTURE delay_line OF ch04_exm04_4 IS
--   SIGNAL    a:    BIT;
--   SIGNAL    b:    BIT;
--   SIGNAL    c:    BIT;
----   ATTRIBUTE keep: BOOLEAN;
----   ATTRIBUTE keep OF a, b, c: SIGNAL IS TRUE;
--BEGIN
--   a <= NOT x;
--   b <= NOT a;
--   c <= NOT b;
--   y <= NOT c;
--END ARCHITECTURE;
--================================================================
-- Comments: 
-- 3: To simulate:
--     
--    
------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------------------------------------------
ENTITY ch04_exm04_4 IS
   PORT (
      x: IN  STD_LOGIC;
      y: OUT STD_LOGIC
   );
END ENTITY;
----------------------------------------------------------------
ARCHITECTURE delay_line OF ch04_exm04_4 IS
   SIGNAL    a:    STD_LOGIC;
   SIGNAL    b:    STD_LOGIC;
   SIGNAL    c:    STD_LOGIC;
   ATTRIBUTE keep: BOOLEAN;
   ATTRIBUTE keep OF a, b, c: SIGNAL IS TRUE;
BEGIN
   a <= NOT x;
   b <= NOT a;
   c <= NOT b;
   y <= NOT c;
END ARCHITECTURE;
------------------------------------------------------------------
