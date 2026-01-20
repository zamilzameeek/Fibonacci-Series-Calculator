# Fibonacci Series Hardware Calculator

Designed and implemented a 4-bit parametric Fibonacci calculator using **Verilog HDL**. The system follows a modular, hierarchical architecture comprising a custom Datapath and a Moore Finite State Machine (FSM) controller.

### **Architecture Overview**

* **Controller FSM**: An 11-state Moore machine (S0 to S10) that manages dataflow, initialization, and iterative calculation cycles.


* **Datapath**: Includes a 4-bit ALU, 2-to-4 line decoders, and specialized registers (D-Flip-Flops) for sequence term storage.


* **ALU Operations**: Supports custom opcodes for ADD, LOAD, STORE, INCREMENT, and COPY.



### **Verification & Results**

* **Functional Verification**: Verified the design using comprehensive testbenches for the top-level system, individual FSM, and Datapath modules.


* **Simulation**: Achieved correct sequence generation (1, 1, 2, 3, 5, 8...) in ModelSim simulations.



### **Tools Used**

* **HDL**: Verilog 


* **Synthesis**: Altera Quartus II 


* **Simulation**: ModelSim 

