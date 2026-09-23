# ece-128-lab-3
ECE 128 Lab 3. Design and Implementation of a 4-Bit Full Adder With a Seven-Segment Display in Verilog using Vivado and a Basys 3 FPGA board.

### Project Description

### Instructions
There is one design file, adder_7_segment_display.v and one testbench adder_7_segment_display_tb.v. The design file uses a decoder module, BCD_to_7_segment_display, to change decimal values to the correct seven bit output for the seven segment display. It also uses a one bit full adder module, full_adder, to create a four bit ripple carry adder module, ripple_carry_adder, and a 2 to 1 mux module. Finally there is a top module, adder_7_segment_display, that instantiates all the other modules to connect them together and creates the proper assignment to display the ones place on the seven segment display. In order to run the simulation and produce the waveform, one must instantiate the adder_7_segment_display module in the testbench. The testbench is set up to do 5 + 3, 2 + 1, and 15 + 1, and use the mux to display the sum and carry out. Any four bit addition can be done by editing A and B in the testbench. 

In order to implement the FPGA, one must run the synthesis and implementation on Vivado with the design file, adder_7_segment_display.v, as the top design source. Once that is done, the bitstream can be generated and the device can be programmed with the constraints defined in the adder_7_segment_display_constraints.xdc file. Using a Basys 3 FPGA board, the switch V17 is the carry in bit, switches V16, W16, W17, and W15 are for the first four bit addend from the LSB to the MSB, switches V15, W14, W13, and V2 are for the second four bit addend from LSB to MSB, and finally, the switch T3 is used to select the sum or carry out bit as the value displayed on the seven segment display in the ones place. On the Basys 3 board, the switches go from right to left in the order just described. 

