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
-- Generated on "04/13/2021 15:33:36"
                                                            
-- Vhdl Test Bench template for design  :  example_nbit_divider
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY example_nbit_divider_vhd_tst IS
END example_nbit_divider_vhd_tst;
ARCHITECTURE example_nbit_divider_arch OF example_nbit_divider_vhd_tst IS
-- constants  
 CONSTANT clockPeriod : TIME := 10 ps;
 CONSTANT resetDelay  : TIME := 30 ps;                                               
-- signals                                                   
SIGNAL clkOut : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL count : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL max_count : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
COMPONENT example_nbit_divider
	PORT (
	clkOut : OUT STD_LOGIC;
	clock : IN STD_LOGIC;
	count : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	max_count : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : example_nbit_divider
	PORT MAP (
-- list connections between master ports and signals
	clkOut => clkOut,
	clock => clock,
	count => count,
	max_count => max_count,
	reset => reset
	);
   
-- init process
init : PROCESS                                               
-- variable declarations                                     
BEGIN
   -- code that executes only once   
   reset <= '0';
   max_count <= "00000011"; 
   wait for clockPeriod*10;     
   reset <= '1';
              
WAIT;                                                       
END PROCESS init;

-- always process                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;

-- clock process
clock_process : process 
begin 
  clock <= '0'; 
  wait for clockPeriod*0.5; 
  clock <= '1'; 
  wait for clockPeriod*0.5; 
end process clock_process;
                                       
END example_nbit_divider_arch;
