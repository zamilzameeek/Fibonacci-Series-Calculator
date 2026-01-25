

# **Fibonacci Series Calculator**

## **Project Overview**

I designed and verified a parametric **4-bit Fibonacci sequence calculator** using **Verilog HDL**. The system is built on a hierarchical, modular architecture that separates control logic from data processing, ensuring high timing efficiency and scalability. The engine autonomously generates the Fibonacci sequence up to a user-defined nth term.


## **Architecture & Implementation**

The design follows a **Separated Controller/Datapath (FSM+D)** architecture, consisting of three primary top-level modules integrated into a single system:

### **1. Control Unit (11-State Moore FSM)**

The "brain" of the calculator is a **Moore Finite State Machine** featuring 11 distinct states (`S0` to `S10`).

* **State Transition Logic**: The FSM manages the algorithm's lifecycle, from initializing sequence constants to executing the iterative addition loop.


* **Conditional Branching**: I implemented branching logic that monitors a hardware `zero_flag`. When the term counter reaches zero, the FSM autonomously transitions to the `DONE` state.


* **Reset Handling**: Includes a global asynchronous reset to force the machine into an idle state (`S0`) for safe system restarts.

  <img width="975" height="632" alt="image" src="https://github.com/user-attachments/assets/e16db928-67ee-4e58-bb24-c108232d7e81" />




### **2. Custom 4-Bit Datapath**

The datapath contains the execution hardware required to store and process the sequence:

* **ALU (Arithmetic Logic Unit)**: A custom processing block executing 3-bit opcodes, including `ADD` (`3'b110`), `LOAD` (`3'b100`), and `DECREMENT` (`3'b011`) .


* **Register File**: Utilizes **D-Flip-Flops** as parametric registers to store current and previous sequence terms.


* **Routing Logic**: Features a hierarchical network of **4-to-1 and 2-to-1 multiplexers** and a **2-to-4 line decoder** for precise register addressing and data flow management.



### **3. Memory Integration**

A rising-edge synchronous memory block holds the input count and stores intermediate data results, acting as the interface between the core logic and external inputs.


## **Technical Specifications & Performance**

The design was synthesized and analyzed using **Altera Quartus II** for the **Cyclone III FPGA** family.

* **Maximum Operating Frequency**: Achieved a restricted  of **219.68 MHz**.


* **Parametric Design**: The entire codebase is fully parameterized, allowing the bit-width (currently 4-bit) to be scaled for larger Fibonacci calculations with minimal changes.


* **Logic Style**: Implemented using a mix of Behavioral FSM and Top-level integration modeling.



## **Verification & Simulation**

I conducted extensive functional verification using **ModelSim**. The testbench suite covers every sub-module and the full system integration:

1. **Top-Level Verification**: Confirmed the system correctly calculates the sequence. For a count of 5, the system successfully outputs the sequence terms and raises the `DONE` flag.
<img width="1196" height="561" alt="image" src="https://github.com/user-attachments/assets/be33fcd1-d646-4a0d-b855-3e79ae1ca5f0" />


2. **FPGA Synthesis & Timing Report**: Official Quartus II TimeQuest Analyzer report showing the 219.68 MHz performance on a Cyclone III device.
<img width="971" height="132" alt="image" src="https://github.com/user-attachments/assets/330ceba6-a85b-4d69-a272-c1b6d43bf128" />




