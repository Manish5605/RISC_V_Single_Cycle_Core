# RISC-V Single Cycle Processor

A 32-bit **Single Cycle RISC-V (RV32I)** processor designed and implemented in **Verilog HDL**. This processor executes each instruction in a single clock cycle and demonstrates the fundamental architecture of a RISC-V CPU.

---

## Project Overview

This project implements the core components of a Single Cycle RISC-V processor, including the datapath and control unit. The design follows a modular approach, making it easy to understand and extend for pipelined architectures.

---

## Features

- 32-bit RISC-V (RV32I) Processor
- Single Cycle Datapath
- Modular Verilog Design
- Register File
- Arithmetic Logic Unit (ALU)
- Main Control Unit
- ALU Decoder
- Sign Extension Unit
- Instruction Memory
- Data Memory
- Program Counter (PC)
- Branch Address Generation
- Multiplexers and Adders

---

## Supported Instructions

### R-Type
- ADD
- SUB
- AND
- OR
- XOR
- SLT

### I-Type
- ADDI
- LW

### S-Type
- SW

### B-Type
- BEQ

---



## Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- Visual Studio Code
- Git & GitHub

---

## How to Run

Compile the design:

```bash
iverilog -o out.vvp Single_Cycle_Top_Tb.v Single_Cycle_Top.v
```

Run the simulation:

```bash
vvp out.vvp
```

View the waveform:

```bash
gtkwave
```

---

## Processor Datapath

*Datapath diagram will be added soon.*

---

## Simulation Results

*Waveform screenshots will be added soon.*

---

## Future Improvements

- Five-stage Pipeline Processor
- Hazard Detection Unit
- Forwarding Unit
- Branch Prediction
- Instruction Cache
- Data Cache
- CSR Instructions
- RV32IM Extension

---

## Learning Outcomes

Through this project, I gained practical experience in:

- Computer Architecture
- RISC-V ISA
- Verilog HDL
- Digital Logic Design
- Datapath Design
- Control Unit Design
- Processor Verification
- RTL Simulation

---

## Author

**Manish**

Electronics Engineering Student

Interested in VLSI Design, Digital Design, Computer Architecture, and Embedded Systems.

---

## License

This project is available under the MIT License.
