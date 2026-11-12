--------------------------------------------------------------------
-- Name of File:   ch02_exc02_1_when_right_tb.vhd
-- Description:    Testbench for ch02_exc02_1_when_right with 100% coverage
-- Author:         Generated Testbench
-- Date:           2026-03-10
--------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.ALL;
USE ieee.std_logic_textio.ALL;

--------------------------------------------------------------------
ENTITY ch02_exc02_1_when_right_tb IS
END ch02_exc02_1_when_right_tb;
--------------------------------------------------------------------
ARCHITECTURE testbench OF ch02_exc02_1_when_right_tb IS
    
    -- Component Declaration
    COMPONENT ch02_exc02_1_when_right
        PORT (
            a, b : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
            sel  : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
            x    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;
    
    -- Test signals
    SIGNAL a_tb   : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL b_tb   : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL sel_tb : STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL x_tb   : STD_LOGIC_VECTOR(7 DOWNTO 0);
    
    -- Test control signals
    SIGNAL test_done : BOOLEAN := FALSE;
    
BEGIN
    
    -- Instantiate the Unit Under Test (UUT)
    uut: ch02_exc02_1_when_right
        PORT MAP (
            a   => a_tb,
            b   => b_tb,
            sel => sel_tb,
            x   => x_tb
        );
    
    -- Test process
    stimulus: PROCESS
        FILE report_file : TEXT OPEN WRITE_MODE IS "test_report.txt";
        VARIABLE line_out : LINE;
        
        -- Test statistics  
        VARIABLE test_count  : INTEGER := 0;
        VARIABLE pass_count  : INTEGER := 0;
        VARIABLE fail_count  : INTEGER := 0;
        
        -- Procedure to check results and report
        PROCEDURE check_result(
            test_name : STRING;
            expected  : STD_LOGIC_VECTOR(7 DOWNTO 0);
            actual    : STD_LOGIC_VECTOR(7 DOWNTO 0)
        ) IS
        BEGIN
            test_count := test_count + 1;
            
            -- Write to report file
            WRITE(line_out, STRING'("Test #"));
            WRITE(line_out, test_count);
            WRITE(line_out, STRING'(": "));
            WRITE(line_out, test_name);
            WRITELINE(report_file, line_out);
            
            WRITE(line_out, STRING'("  Inputs: a="));
            WRITE(line_out, a_tb);
            WRITE(line_out, STRING'(", b="));
            WRITE(line_out, b_tb);
            WRITE(line_out, STRING'(", sel="));
            WRITE(line_out, sel_tb);
            WRITELINE(report_file, line_out);
            
            WRITE(line_out, STRING'("  Expected: "));
            WRITE(line_out, expected);
            WRITE(line_out, STRING'(", Got: "));
            WRITE(line_out, actual);
            WRITELINE(report_file, line_out);
            
            IF actual = expected THEN
                WRITE(line_out, STRING'("  Result: PASS"));
                pass_count := pass_count + 1;
                REPORT "PASS: " & test_name SEVERITY NOTE;
            ELSE
                WRITE(line_out, STRING'("  Result: FAIL"));
                fail_count := fail_count + 1;
                REPORT "FAIL: " & test_name SEVERITY ERROR;
            END IF;
            WRITELINE(report_file, line_out);
            WRITE(line_out, STRING'(""));
            WRITELINE(report_file, line_out);
            
        END PROCEDURE check_result;
        
    BEGIN
        -- Write header to report file
        WRITE(line_out, STRING'("============================================================"));
        WRITELINE(report_file, line_out);
        WRITE(line_out, STRING'("  Testbench Report for ch02_exc02_1_when_right"));
        WRITELINE(report_file, line_out);
        WRITE(line_out, STRING'("  Date: 2026-03-10"));
        WRITELINE(report_file, line_out);
        WRITE(line_out, STRING'("============================================================"));
        WRITELINE(report_file, line_out);
        WRITE(line_out, STRING'(""));
        WRITELINE(report_file, line_out);
        
        REPORT "Starting testbench for ch02_exc02_1_when_right" SEVERITY NOTE;
        
        -- Test Case 1: sel = "00" should output "00000000"
        a_tb   <= "10101010";
        b_tb   <= "11110000";
        sel_tb <= "00";
        WAIT FOR 10 ns;
        check_result("Select 00 - Output all zeros", "00000000", x_tb);
        
        -- Test Case 2: sel = "01" should output a
        a_tb   <= "10101010";
        b_tb   <= "11110000";
        sel_tb <= "01";
        WAIT FOR 10 ns;
        check_result("Select 01 - Output input a", "10101010", x_tb);
        
        -- Test Case 3: sel = "01" with different a value
        a_tb   <= "11001100";
        b_tb   <= "11110000";
        sel_tb <= "01";
        WAIT FOR 10 ns;
        check_result("Select 01 - Output input a (different value)", "11001100", x_tb);
        
        -- Test Case 4: sel = "10" should output b
        a_tb   <= "10101010";
        b_tb   <= "11110000";
        sel_tb <= "10";
        WAIT FOR 10 ns;
        check_result("Select 10 - Output input b", "11110000", x_tb);
        
        -- Test Case 5: sel = "10" with different b value
        a_tb   <= "10101010";
        b_tb   <= "00110011";
        sel_tb <= "10";
        WAIT FOR 10 ns;
        check_result("Select 10 - Output input b (different value)", "00110011", x_tb);
        
        -- Test Case 6: sel = "11" should output "ZZZZZZZZ"
        a_tb   <= "10101010";
        b_tb   <= "11110000";
        sel_tb <= "11";
        WAIT FOR 10 ns;
        check_result("Select 11 - Output high impedance", "ZZZZZZZZ", x_tb);
        
        -- Test Case 7: Verify all zeros on inputs with sel="01"
        a_tb   <= "00000000";
        b_tb   <= "11111111";
        sel_tb <= "01";
        WAIT FOR 10 ns;
        check_result("Select 01 - Input a all zeros", "00000000", x_tb);
        
        -- Test Case 8: Verify all ones on inputs with sel="01"
        a_tb   <= "11111111";
        b_tb   <= "00000000";
        sel_tb <= "01";
        WAIT FOR 10 ns;
        check_result("Select 01 - Input a all ones", "11111111", x_tb);
        
        -- Test Case 9: Verify all zeros on inputs with sel="10"
        a_tb   <= "11111111";
        b_tb   <= "00000000";
        sel_tb <= "10";
        WAIT FOR 10 ns;
        check_result("Select 10 - Input b all zeros", "00000000", x_tb);
        
        -- Test Case 10: Verify all ones on inputs with sel="10"
        a_tb   <= "00000000";
        b_tb   <= "11111111";
        sel_tb <= "10";
        WAIT FOR 10 ns;
        check_result("Select 10 - Input b all ones", "11111111", x_tb);
        
        -- Write summary to report file
        WRITE(line_out, STRING'("============================================================"));
        WRITELINE(report_file, line_out);
        WRITE(line_out, STRING'("  Test Summary"));
        WRITELINE(report_file, line_out);
        WRITE(line_out, STRING'("============================================================"));
        WRITELINE(report_file, line_out);
        WRITE(line_out, STRING'("  Total Tests:  "));
        WRITE(line_out, test_count);
        WRITELINE(report_file, line_out);
        WRITE(line_out, STRING'("  Passed:       "));
        WRITE(line_out, pass_count);
        WRITELINE(report_file, line_out);
        WRITE(line_out, STRING'("  Failed:       "));
        WRITE(line_out, fail_count);
        WRITELINE(report_file, line_out);
        
        IF fail_count = 0 THEN
            WRITE(line_out, STRING'("  Status:       ALL TESTS PASSED"));
            WRITELINE(report_file, line_out);
            REPORT "============================================================" SEVERITY NOTE;
            REPORT "ALL TESTS PASSED! Total: " & INTEGER'IMAGE(test_count) SEVERITY NOTE;
            REPORT "============================================================" SEVERITY NOTE;
        ELSE
            WRITE(line_out, STRING'("  Status:       SOME TESTS FAILED"));
            WRITELINE(report_file, line_out);
            REPORT "============================================================" SEVERITY ERROR;
            REPORT "SOME TESTS FAILED! Passed: " & INTEGER'IMAGE(pass_count) & 
                   " Failed: " & INTEGER'IMAGE(fail_count) SEVERITY ERROR;
            REPORT "============================================================" SEVERITY ERROR;
        END IF;
        
        WRITE(line_out, STRING'(""));
        WRITELINE(report_file, line_out);
        WRITE(line_out, STRING'("Coverage Analysis:"));
        WRITELINE(report_file, line_out);
        WRITE(line_out, STRING'("  - sel='00' case: Covered"));
        WRITELINE(report_file, line_out);
        WRITE(line_out, STRING'("  - sel='01' case: Covered (multiple values tested)"));
        WRITELINE(report_file, line_out);
        WRITE(line_out, STRING'("  - sel='10' case: Covered (multiple values tested)"));
        WRITELINE(report_file, line_out);
        WRITE(line_out, STRING'("  - sel='11' case: Covered"));
        WRITELINE(report_file, line_out);
        WRITE(line_out, STRING'("  Coverage: 100%"));
        WRITELINE(report_file, line_out);
        WRITE(line_out, STRING'("============================================================"));
        WRITELINE(report_file, line_out);
        
        test_done <= TRUE;
        WAIT;
    END PROCESS stimulus;
    
END testbench;
--------------------------------------------------------------------
