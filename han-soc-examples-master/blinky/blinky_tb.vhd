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
-- Generated on "05/23/2022 11:46:32"
                                                            
-- Vhdl Test Bench template for design  :  blinky
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY blinky_vhd_tst IS
END blinky_vhd_tst;
ARCHITECTURE blinky_arch OF blinky_vhd_tst IS
-- constants                                                 
   CONSTANT CLOCK_PERIOD : TIME := 20 ns; 
 
-- signals                                                   
SIGNAL LEDR : STD_LOGIC_VECTOR(0 TO 9);
SIGNAL MAX10_CLK1_50 : STD_LOGIC;
COMPONENT blinky
   PORT (
   LEDR : OUT STD_LOGIC_VECTOR(0 TO 9);
   MAX10_CLK1_50 : IN STD_LOGIC
   );
END COMPONENT;
BEGIN
   i1 : blinky
   PORT MAP (
-- list connections between master ports and signals
   LEDR => LEDR,
   MAX10_CLK1_50 => MAX10_CLK1_50
   );
	
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           

always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          

-- clock process
clock_process : PROCESS 
BEGIN 
  MAX10_CLK1_50 <= '0'; 
  WAIT FOR CLOCK_PERIOD*0.5; 
  MAX10_CLK1_50 <= '1'; 
  WAIT FOR CLOCK_PERIOD*0.5; 
END PROCESS clock_process;

END blinky_arch;
