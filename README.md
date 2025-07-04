# Task-2-RAM
company : CODTECH IT SOLUTIONS 
NAME : ARIGELLA VIJAY KUMAR 
Intern ID:CT04DG3476
DOMAIN : VLSI
BATCH DURATION :  June 23rd, 2025 to July 23rd, 2025. 
MENTOR  NAME : Neela Santhosh Kumar 

In this task, I have designed and simulated a simple synchronous Random Access Memory (RAM) module using Verilog Hardware Description Language (HDL). The primary objective of this task was to understand the memory design concepts, especially how read and write operations are implemented in synchronous memory structures. RAM is one of the most fundamental components of digital systems and is widely used in processors, microcontrollers, and other embedded systems to temporarily store data during computation.

The RAM module that I designed is a small 16 x 8-bit memory, which means it has 16 address locations, and each location can store 8 bits of data. To implement this, I used a two-dimensional register array (`reg [7:0] mem [0:15]`). This setup allows us to store and access data efficiently during simulation. The module takes several inputs: a clock signal (`clk`), a write enable signal (`we`), a 4-bit address line (`addr`), and an 8-bit data input line (`din`). The module also has an 8-bit data output line (`dout`), which is used to read data from the memory.

In synchronous RAM, both read and write operations happen with respect to the clock edge. Therefore, in my design, I used an always block sensitive to the positive edge of the clock (`always @(posedge clk)`). When the write enable signal (`we`) is high, the data on `din` is written to the specified address (`addr`). Simultaneously, the output `dout` is updated to reflect the data stored at that address. If the write enable is low, no new data is written, but the data at the given address is still presented on the output.

To verify the correctness of the RAM module, I developed a comprehensive Verilog testbench. In this testbench, I first initialized all inputs and generated a periodic clock signal using an always block that toggles every 5 time units (`always #5 clk = ~clk;`). The testbench performs a sequence of operations: it writes specific data values to certain memory addresses and then reads them back to ensure that the correct data is stored and retrieved. Specifically, I wrote the value `8'hAA` to address `2` and `8'h55` to address `5`. After writing, I set the write enable signal to low and read back the data from these addresses to verify correctness.

For visual verification and analysis, I used the `$dumpfile` and `$dumpvars` system tasks to generate a VCD (Value Change Dump) file, which can be viewed using waveform viewers such as EPWave on EDA Playground. By analyzing the waveforms, I could confirm that the data was correctly written to and read from the specified addresses. The simulation waveforms clearly show the transitions of the address lines, data inputs, write enable signals, and data outputs, which help in understanding the behavior of the RAM in each clock cycle.

Through this task, I not only enhanced my Verilog coding skills but also gained a deep understanding of synchronous memory design and timing considerations. I learned how crucial the clock signal and control signals like write enable are in memory operation. The importance of proper simulation and verification was also reinforced, as analyzing waveforms helped detect and fix possible logical or timing errors.

Finally, all the design codes, testbench files, and waveform screenshots have been well documented and uploaded to my GitHub repository for reference and evaluation. This task has provided me a solid foundation in memory design, which is essential for any digital system or processor design. It has also improved my debugging and analysis skills, preparing me for more complex VLSI and digital design challenges in the future.

