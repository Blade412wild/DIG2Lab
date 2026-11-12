--------------------------------------------------------------------
--! \file      ch03_exm03_9.vhd
--! \date      see top of 'Version History'
--! \brief     Example 3.9 of Pedroni 2nd Ed, page 75.
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |10-10-2018 |WLGRW   |Initial Version
--! 002    |3-12-2019  |WLGRW   |Added architecture switch
--!
--! Comments: 
--! -- 1: These architectures cannot be used at the same time in this
--!       example.

--! Function description:
--! ---------------------
--! The code below is for a signed multiplier with inputs a and b  
--! and output prod, all of type STD_LOGIC_VECTOR (industry standard).
--!
--! \verbatim
--!  
--!           +-----------+
--!           |           |
--!  a(3:0) ->|           |
--!           |  product  |-> prod(7:0)
--!  b(3:0) ->|           |
--!           |           |
--!           +-----------+
--!
--! \endverbatim
--!
--! Assignment:
--! -----------
--! Knowing that the type casting expression STD_LOGIC_VECTOR(arg)  
--! just described can convert an argument of type SIGNED to
--! STD_LOGIC_VECTOR when the package numeric_std is used, or from 
--! SIGNED or STD_LOGIC_VECTOR (hence overloaded ) to 
--! STD_LOGIC_VECTOR when the package std_logic_arith is employed.
--! 
--! Use the template project that is delivered with this project.
--! 
--! 1: Analyze all three architectures below (all legal) and make proper 
--!    comments that express how the code is working.
--! 2: Assume that arch1 uses the package numeric_std, while arch2 and arch3
--!    employ std_logic_arith. Which is the recommended approach?
--! 
--! Using this code:
--! ----------------
--! - This code is using CONFIGURATION to select the architecture.
--! - When selecting ARCHITECTURE "arch1", "ieee.std_logic_arith.all"
--!   shall be commented.
--! - When selecting ARCHITECTURE "arch2" or "arch3", "ieee.numeric_std.all"
--!   shall be commented.

------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;      --! for arch1
--USE ieee.std_logic_arith.all; --! for arch2, arch3
------------------------------------------------------------------
ENTITY ch03_exm03_9 IS                 -- Was "signed_multiplier"
PORT (
      a:    IN    STD_LOGIC_VECTOR(3 DOWNTO 0);
      b:    IN    STD_LOGIC_VECTOR(3 DOWNTO 0);
      prod: OUT   STD_LOGIC_VECTOR(7 DOWNTO 0)
     );
END ENTITY;
------------------------------------------------------------------
--! Configuration selector. Selects ARCHITECTURE for a solution.
--! uncomment the architecture you want to use/compile.
------------------------------------------------------------------
CONFIGURATION which_architecture OF ch03_exm03_9 IS
   FOR arch1 
--   FOR arch2
--   FOR arch3
   END FOR;
END CONFIGURATION;
------------------------------------------------------------------
ARCHITECTURE arch1 OF ch03_exm03_9 IS
   SIGNAL a_sig, b_sig: SIGNED(3 DOWNTO 0);
BEGIN

   a_sig <= SIGNED(a);
   b_sig <= SIGNED(b);
   
   prod  <= STD_LOGIC_VECTOR(a_sig * b_sig);

END arch1;
------------------------------------------------------------------
ARCHITECTURE arch2 OF ch03_exm03_9 IS
   SIGNAL a_sig, b_sig: SIGNED(3 DOWNTO 0);
   SIGNAL prod_sig:     SIGNED(7 DOWNTO 0);
BEGIN

   a_sig <= SIGNED(a);
   b_sig <= SIGNED(b);
   
   prod_sig <= a_sig * b_sig;
   prod     <= STD_LOGIC_VECTOR(prod_sig);
   
END arch2;
------------------------------------------------------------------
ARCHITECTURE arch3 OF ch03_exm03_9 IS
   SIGNAL a_sig, b_sig: SIGNED(3 DOWNTO 0);
BEGIN

   a_sig <= SIGNED(a);
   b_sig <= SIGNED(b);
   
--   prod  <= STD_LOGIC_VECTOR(a_sig * b_sig);  -- Not working; incomplete
   prod  <= STD_LOGIC_VECTOR(SIGNED'(a_sig * b_sig));

END arch3;
------------------------------------------------------------------
