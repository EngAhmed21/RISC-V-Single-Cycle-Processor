# RISC-V-Single-Cycle-Processor

Introduction:                                                                                                                                                                                                                                
In the dynamic landscape of computer architecture, the RISC-V instruction set has emerged as a beacon of innovation, offering an open and extensible foundation for processor design. As we navigate the intricate realm of RISC-V, this article serves as a compass, guiding us through the fundamental aspects of its instruction set and the intricacies of single-cycle and multi-cycle implementations.
At the heart of RISC-V lies its instruction set architecture (ISA), characterized by a streamlined design philosophy that emphasizes simplicity, efficiency, and openness. As we delve into the RISC-V instruction set, we will decode the architecture's unique approach to command execution, exploring how it strikes a balance between performance and versatility. From its elegant simplicity to its comprehensive set of instructions, RISC-V beckons us to rethink the way processors interpret and execute commands.
Venturing further, we will dissect the single-cycle implementation of RISC-V, where each instruction is executed in a single clock cycle. This efficient approach simplifies the pipeline and promises low-latency processing. We'll examine the intricacies of the single-cycle architecture, uncovering how it optimizes execution speed and resource utilization. Through detailed analysis, we aim to illustrate the strengths and limitations of the single-cycle paradigm, providing insights into its real-world applications and trade-offs.

Instruction Set Architecture:                                                                                                                                                                                                                              
Within the expansive RISC-V Instruction Set Architecture (ISA), I have taken a deliberate approach by carefully choosing a range of instructions that span various formats, including computational, control flow, and memory access. This selective approach will guide us as we design a custom Datapath and precisely specify the control signals needed to execute our chosen instructions efficiently.
The instruction set in RISC-V is organized into distinct instruction formats, with each format comprising individual "fields." These fields are essentially separate unsigned integers, each serving as a dedicated container for conveying precise information about the intended operation to be executed.
 	                                                                                                                                                                                                                                          
![image](https://github.com/EngAhmed21/RISC-V-Single-Cycle-Processor/assets/90782588/ac3c0629-ffdd-48b5-8ee5-4093d55af31a)

Supported Instructions:                                                                                                                                                                                                                          
1. R-Type Instructions

   
![image](https://github.com/EngAhmed21/RISC-V-Single-Cycle-Processor/assets/90782588/59f58fa4-9e0b-4df6-ade5-1f332d80704c)

2. I-Type Instructions
![image](https://github.com/EngAhmed21/RISC-V-Single-Cycle-Processor/assets/90782588/92fe2a4b-bfca-4e9b-b5a3-554f1f2b8707)


3. S/B-Type Instructions
![image](https://github.com/EngAhmed21/RISC-V-Single-Cycle-Processor/assets/90782588/2482f435-8f44-4c6b-a496-d9b6bc9c6f88)


4. U/J-Type Instructions
![image](https://github.com/EngAhmed21/RISC-V-Single-Cycle-Processor/assets/90782588/b9ec1e60-28f1-424f-814e-02de8b615c06)


Architecture:                                                                                                                                                                                                                 

![Screenshot (854)](https://github.com/EngAhmed21/RISC-V-Single-Cycle-Processor/assets/90782588/ecd10f1f-9166-4db6-a75a-db36a2a977f3)


Control Unit:                                                                                                                                                                                                                                                                                                                                                                                                                     


![Screenshot (855)](https://github.com/EngAhmed21/RISC-V-Single-Cycle-Processor/assets/90782588/7087294c-0621-42da-abf4-81ea5ac484f2)
                                                                                                                                                                                                
1. ALU Decoder

![Screenshot (856)](https://github.com/EngAhmed21/RISC-V-Single-Cycle-Processor/assets/90782588/e31c3cd9-0fd3-4fe0-be8e-f61e8a33f9ea)

2. Main Decoder

![Screenshot (857)](https://github.com/EngAhmed21/RISC-V-Single-Cycle-Processor/assets/90782588/ae548005-5cd9-4ae3-b11b-c2a268c5ec92)


Simulation using QuestaSim:                                                                                                                                                                                                                                                                                                                                                                                                 

![Screenshot (841)](https://github.com/EngAhmed21/RISC-V-Single-Cycle-Processor/assets/90782588/c880a62f-e3ec-4782-9fcb-d93f7d747678)


Elaboration Design using VIVADO:                                                                                                                                                                                                                                            

![Screenshot (840)](https://github.com/EngAhmed21/RISC-V-Single-Cycle-Processor/assets/90782588/d91b9005-cfe1-449b-86f1-6816db7867a5)


Synthesis using VIVADO:

![Screenshot (844)](https://github.com/EngAhmed21/RISC-V-Single-Cycle-Processor/assets/90782588/6b6f39d6-4d54-4066-9109-a68aed71d622)
