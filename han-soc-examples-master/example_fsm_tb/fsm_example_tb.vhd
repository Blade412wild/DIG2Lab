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
-- Generated on "05/26/2020 09:26:55"
                                                            
-- Vhdl Test Bench template for design  :  fsm_example
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 
------------------------------------------------------------
LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
------------------------------------------------------------
ENTITY fsm_example_tb IS
END fsm_example_tb;
------------------------------------------------------------
ARCHITECTURE fsm_example_arch OF fsm_example_tb IS
   -- constants                                                 
   CONSTANT clockPeriod : TIME := 100 ns; -- Period T for one clock cycle

   -- signals                                                   
   SIGNAL clk : STD_LOGIC;
   SIGNAL input : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL output : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL reset : STD_LOGIC;
   
   COMPONENT fsm_example PORT (
         clk    : IN  STD_LOGIC;
         input  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
         output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         reset  : IN  STD_LOGIC
      );
   END COMPONENT;
   
BEGIN

   i1 : fsm_example 
   PORT MAP (
      -- list connections between master ports and signals
      clk    => clk,
      input  => input,
      output => output,
      reset  => reset
   );
   
   init : PROCESS                                               
   -- variable declarations                                     
   BEGIN                                                        
      -- code that executes only once                      
      
   -- =========== START ADDED CODE ===========
      
      -- Initial settings
      input <= "0000"; -- 0 
      -- reset
      reset <= '0'; 
      WAIT FOR 140 ns;
      reset <= '1';

      WAIT FOR 90 ns;   -- 
      input <= "0001";  -- 1
      
      WAIT FOR 190 ns;  -- to set at 420 ns: 420-230=190 ns to wait!
      input <= "0000";
      
      WAIT FOR 190 ns;  -- to set at 530 ns: 530-420=110 ns to wait!
      input <= "0010";  -- 2
      
      WAIT FOR 190 ns;  -- to set at 710 ns: 710-420=290 ns to wait!
      input <= "0000";
      
   -- =========== END ADDED CODE ===========

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
   
   -- =========== START ADDED CODE ===========
   -- Clock generator
   clock_process : process
   begin

      clk <= '0';
      wait for clockPeriod/2;
      clk <= '1';
      wait for clockPeriod/2;
      
   end process clock_process;
   
   -- =========== END ADDED CODE ===========

END fsm_example_arch;
------------------------------------------------------------
