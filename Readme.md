
# Verilog Gate Simulator

This project demonstrates the simulation of basic logic gates using Verilog HDL. It is designed for beginners who want to learn digital logic design and simulation through simple and clear examples. The project includes implementations of the fundamental logic gates: AND, OR, NOT, NAND, NOR, XOR, and XNOR. Each gate is written as a separate Verilog module, and a single testbench is provided to verify their functionality.

# Introduction

The purpose of this project is to provide a hands-on introduction to digital logic implementation in Verilog. By simulating basic gates, learners can understand how logic levels propagate and how to verify their behavior through waveform analysis. The project is simple, modular, and easy to extend with additional components such as multiplexers, decoders, or flip-flops.

# Features

* Individual Verilog modules for each logic gate
* Common testbench for simulation and verification
* Example waveform outputs for visualization
* Organized folder structure for clarity and scalability

# Project Structure

verilog-gates-sim/

│

├── src/

│   ├── and_gate.v

│   ├── or_gate.v

│   ├── not_gate.v

│   ├── nand_gate.v

│   ├── nor_gate.v

│   ├── xor_gate.v

│   └── xnor_gate.v

│

├── testbench/

│   └── gates_tb.v

│

├── waveforms/

│   └── gates_waveform.vcd

│

└── README.txt

# Running the Simulation

You can run this project using any Verilog simulator such as Icarus Verilog or ModelSim.

Example using Icarus Verilog:

1. Compile the design and testbench:

   iverilog -o gates_sim src/*.v testbench/gates_tb.v
2. Run the simulation:

   vvp gates_sim
3. (Optional) View the waveform file in GTKWave:

   gtkwave waveforms/gates_waveform.vcd

# Learning Objectives

* Understand how to implement basic digital gates using Verilog
* Learn how to create and execute testbenches
* Analyze simulation results and waveform timing
* Build a foundation for designing more complex digital systems

**Tools Used**

1. **Icarus Verilog – Open-source Verilog simulator**
2. **GTKWave – Waveform viewer for VCD files**

# License

This project is released under the MIT License. You are free to use, modify, and distribute it with proper attribution.

# Contributions

Contributions are welcome. You can enhance the project by adding new gate modules, compound circuits, or improved documentation. Feel free to fork and submit pull requests.
