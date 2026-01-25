

# **Fibonacci Series Calculator**

## **Project Overview**

I designed and verified a parametric **4-bit Fibonacci sequence calculator** using **Verilog HDL**. The system is built on a hierarchical, modular architecture that separates control logic from data processing, ensuring high timing efficiency and scalability. The engine autonomously generates the Fibonacci sequence () up to a user-defined  term.

---

## **Architecture & Implementation**

The design follows a **Separated Controller/Datapath (FSM+D)** architecture, consisting of three primary top-level modules integrated into a single system:

### **1. Control Unit (11-State Moore FSM)**

The "brain" of the calculator is a **Moore Finite State Machine** featuring 11 distinct states (`S0` to `S10`).

* 
**State Transition Logic**: The FSM manages the algorithm's lifecycle, from initializing sequence constants to executing the iterative addition loop.


* **Conditional Branching**: I implemented branching logic that monitors a hardware `zero_flag`. When the term counter reaches zero, the FSM autonomously transitions to the `DONE` state.


* 
**Reset Handling**: Includes a global asynchronous reset to force the machine into an idle state (`S0`) for safe system restarts.



### **2. Custom 4-Bit Datapath**

The datapath contains the execution hardware required to store and process the sequence:

* 
**ALU (Arithmetic Logic Unit)**: A custom processing block executing 3-bit opcodes, including `ADD` (`3'b110`), `LOAD` (`3'b100`), and `DECREMENT` (`3'b011`) .


* 
**Register File**: Utilizes **D-Flip-Flops** as parametric registers to store current and previous sequence terms.


* 
**Routing Logic**: Features a hierarchical network of **4-to-1 and 2-to-1 multiplexers** and a **2-to-4 line decoder** for precise register addressing and data flow management.



### **3. Memory Integration**

A rising-edge synchronous memory block holds the input count and stores intermediate data results, acting as the interface between the core logic and external inputs.

---

## **Technical Specifications & Performance**

The design was synthesized and analyzed using **Altera Quartus II** for the **Cyclone III FPGA** family.

* 
**Maximum Operating Frequency ()**: Achieved a restricted  of **219.68 MHz**.


* 
**Parametric Design**: The entire codebase is fully parameterized, allowing the bit-width (currently 4-bit) to be scaled for larger Fibonacci calculations with minimal changes.


* 
**Logic Style**: Implemented using a mix of Behavioral (FSM) and Structural (Top-level integration) modeling.



---

## **Verification & Simulation**

I conducted extensive functional verification using **ModelSim**. The testbench suite covers every sub-module and the full system integration:

1. **Top-Level Verification**: Confirmed the system correctly calculates the sequence. For a count of 5, the system successfully outputs the sequence terms and raises the `DONE` flag.


2. 
**ALU Stress Test**: Verified all opcodes and the `zero_flag` accuracy.


3. 
**FSM State Trace**: Traced all 11 states to ensure deterministic transitions and proper opcode generation.



---

## **How to Run**

1. **Synthesis**: Open the project in **Quartus II** and compile `src/FSM_TOP_LEVEL.v`.
2. **Simulation**: Load the testbenches in **ModelSim** to view the timing waveforms.
* Top-level: `sim/FSM_TOP_LEVEL_tb.v`
* Datapath: `sim/fibo_datapath_tb.v`
