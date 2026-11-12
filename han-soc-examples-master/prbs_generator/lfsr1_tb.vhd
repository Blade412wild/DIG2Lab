-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "06/01/2021 10:57:22"
                                                            
-- Vhdl Test Bench template for design  :  lfsr1
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.ALL;
use std.textio.all;                                

ENTITY lfsr1_vhd_tst IS
END lfsr1_vhd_tst;
ARCHITECTURE lfsr1_arch OF lfsr1_vhd_tst IS
-- constants  
constant PERIOD : time := 20 ns;
-- signals                                                   
SIGNAL clk    : STD_LOGIC := '0';
SIGNAL count  : STD_LOGIC_VECTOR(14 DOWNTO 0);
SIGNAL reset  : STD_LOGIC := '0';
signal endSim : BOOLEAN := false;

COMPONENT lfsr1
	PORT (
	clk : IN STD_LOGIC;
	count : OUT STD_LOGIC_VECTOR(14 DOWNTO 0);
	reset : IN STD_LOGIC
	);
END COMPONENT;

BEGIN
clk <= not clk after PERIOD/2;
reset <= '1' after PERIOD*2;
endSim <= true after PERIOD*8000;

-- End the simulation
process
begin
   if (endSim) then
      assert false
      report "End of simulation."
      severity failure;
   end if;

   wait until (clk = '1');
end process;

lfrs1_inst : lfsr1
port map (
   clk => clk,
   reset => reset,
   count => count
);
                                        
END lfsr1_arch;
