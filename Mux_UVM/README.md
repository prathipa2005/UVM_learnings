# 2:1 Multiplexer Verification using UVM

## Overview

This project demonstrates the complete verification of a 2:1 Multiplexer using the Universal Verification Methodology (UVM).

The objective of this project is to understand the basic UVM architecture by implementing all the fundamental UVM components and verifying a simple DUT.

---

## DUT

- 2:1 Multiplexer

---

## UVM Components Implemented

- Transaction (Sequence Item)
- Sequence
- Sequencer
- Driver
- Monitor
- Scoreboard
- Agent
- Environment
- Test
- Top Testbench
- UVM Package

---

## Project Structure

```
Mux_UVM/

│── Mux_dut.sv
│── interface.sv
│── Sequence_item.sv
│── sequence.sv
│── sequencer.sv
│── driver.sv
│── monitor.sv
│── scoreboard.sv
│── agent.sv
│── environment.sv
│── test.sv
│── mux_pkg.sv
│── top_tb.sv
```

---

## Verification Flow

```
Sequence
    │
    ▼
Sequencer
    │
    ▼
Driver
    │
    ▼
2:1 MUX (DUT)
    │
    ▼
Monitor
    │
    ▼
Scoreboard
    │
    ▼
PASS / FAIL
```

---

## Tool Used

- **Language:** SystemVerilog
- **Methodology:** UVM 1.2
- **Platform:** EDA Playground
- **Simulator:** Aldec Riviera-PRO

---

## Simulation

In EDA Playground,

1. Select **SystemVerilog/UVM**.
2. Choose **Aldec Riviera-PRO** as the simulator.
3. Add all project files.
4. Ensure the compilation order is:
   - Mux_dut.sv
   - interface.sv
   - mux_pkg.sv
   - top_tb.sv
5. Run the simulation.

---

## Expected Output

The Scoreboard compares the DUT output with the expected output and reports:

```
PASS : a=0 b=1 sel=0 expected=0 actual=0
PASS : a=1 b=0 sel=1 expected=0 actual=0
PASS : a=1 b=1 sel=0 expected=1 actual=1
```

Any mismatch is reported using `uvm_error`.

---

## Learning Outcome

This project demonstrates:

- Building a complete UVM verification environment
- Communication between UVM components
- Driver–Sequencer handshake
- Monitor–Scoreboard communication using Analysis Port
- UVM Factory
- UVM Config Database
- UVM Phases
- Objection mechanism
- End-to-end verification flow

---

## Author

**Prathipa L**

GitHub: https://github.com/prathipa2005