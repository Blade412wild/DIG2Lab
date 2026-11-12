# VHDL Testing and Development Project

## Project Overview
This directory contains a VHDL design project with comprehensive testing capabilities. The design files are used in both Intel Quartus Prime for FPGA synthesis and various simulation tools for verification.

## Files Description

### Source Files
- **ch02_exc02_1_when_right.vhd** - Main VHDL design file implementing a 2-to-1 multiplexer with conditional signal assignment
- **ch02_exc02_1_when_right_tb.vhd** - Comprehensive testbench with 100% code coverage

### Project Files
- **ch02_exc02_1_when_right.qpf** - Quartus Prime project file
- **ch02_exc02_1_when_right.qsf** - Quartus settings file with pin assignments and device configuration
- **ch02_exc02_1_when_right.qdf** - Quartus default settings file

### Test Automation
- **test_report.txt** - Generated test report with detailed results (auto-generated)

## Using with Intel Quartus Prime

The VHDL source files are integrated into the Quartus Prime project for FPGA synthesis and implementation:

1. Open the project:
   ```
   quartus ch02_exc02_1_when_right.qpf
   ```

2. The design targets an Intel Cyclone V device (as configured in the .qsf file)

3. Compile the project through Quartus to:
   - Synthesize the design
   - Perform place and route
   - Generate programming files
   - Run timing analysis

## Testing with Aldec Active-HDL

The VHDL files in this directory can be tested using **Aldec Active-HDL**, a professional HDL simulation and verification tool.

### Active-HDL Setup

1. **Create a new workspace** in Active-HDL
2. **Add the design files:**
   - ch02_exc02_1_when_right.vhd (design under test)
   - ch02_exc02_1_when_right_tb.vhd (testbench)

3. **Compile order:**
   - First compile: `ch02_exc02_1_when_right.vhd`
   - Then compile: `ch02_exc02_1_when_right_tb.vhd`

4. **Run simulation:**
   - Set `ch02_exc02_1_when_right_tb` as the top-level entity
   - Run simulation for at least 200ns to complete all tests
   - View waveforms to analyze signal behavior

### Active-HDL Features to Utilize

- **Waveform Viewer:** Observe input/output signals and timing relationships
- **Code Coverage:** Verify 100% statement and branch coverage
- **Assertions:** The testbench includes built-in pass/fail reporting
- **Signal Breakpoints:** Debug specific test cases interactively

## Alternative Testing with GHDL

For open-source testing, GHDL can be used:

```powershell
# Compile design and testbench
ghdl -a --std=08 ch02_exc02_1_when_right.vhd
ghdl -a --std=08 ch02_exc02_1_when_right_tb.vhd

# Elaborate
ghdl -e --std=08 ch02_exc02_1_when_right_tb

# Run simulation
ghdl -r --std=08 ch02_exc02_1_when_right_tb --stop-time=200ns
```

Or simply execute:
```powershell
.\run_test.ps1
```

## Test Coverage

The testbench achieves **100% code coverage** by testing:
- All selector combinations (00, 01, 10, 11)
- Boundary values (all zeros, all ones)
- Multiple data patterns
- High-impedance output state

### Test Report

After running the simulation, a detailed `test_report.txt` file is generated containing:
- Individual test case results
- Input/output values for each test
- Pass/fail status
- Coverage analysis summary

## Design Functionality

The design implements a 4-input multiplexer:
- **sel = "00"**: Output = "00000000" (all zeros)
- **sel = "01"**: Output = input `a` (8-bit)
- **sel = "10"**: Output = input `b` (8-bit)
- **sel = "11"**: Output = "ZZZZZZZZ" (high impedance)

## Workflow Summary

1. **Development:** Edit VHDL source files
2. **Simulation:** Test with Active-HDL or GHDL to verify functionality
3. **Synthesis:** Use Quartus Prime to synthesize for target FPGA
4. **Validation:** Review test reports and timing analysis
5. **Programming:** Generate and download bitstream to FPGA hardware

## Notes

- Always run simulation tests before synthesizing in Quartus
- The testbench is compatible with VHDL-2008 standard
- Quartus project files contain device-specific pin assignments
- Generated files (db/, output_files/, etc.) are excluded from version control

---

*For questions or issues, refer to the course materials or contact the instructor.*
