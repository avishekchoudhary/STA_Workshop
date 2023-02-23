# VSD-IAT: Sign-off Timing Analysis - Basics to Advanced
![image](https://user-images.githubusercontent.com/73732594/152016610-be3ef4c8-601c-40e7-af85-91dc3ae9b2a4.png)

Static timing analysis (STA) is a method of validating the timing performance of a design by checking all possible paths for timing violations. STA breaks a design down into timing paths, calculates the signal propagation delay along each path, and checks for violations of timing constraints inside the design and at the input/output interface.  The workshop covers all the basic concepts in STA and Timing constraints. 

It starts with basics of Static Timing Analysis, timing paths, startpoint, endpoint and combinational logic definitions. It explains setup and hold checks, how STA tools calculate setup and hold violations. Then it slowly builds up to cover all aspects of STA like multiple types of timing paths, design rule checks, checks on async pins and clock gates. After that we go into slightly advanced topics like Time borrowing on latches, timing arcs, cell delays and models, impact of clock network on STA. Since STA and timing constraints go hand in hand the workshop covers basics of all the timing constraints that an engineer should know for STA like clock definitions, clock groups, clock characteristics, port delays and timing exceptions. 

**Contents:**

<!-- @import "[TOC]" {cmd="toc" depthFrom=2 depthTo=6 orderedList=false`} -->

<!-- code_chunk_output -->

- [Day-1 Summary](#day-1-summary)
	
- [Day-1 Labs](#day-1-labs)
  - [OpenSTA Introduction](#ot_Intro)
  - [Understanding basics of OpenSTA](#ot_basics)
  - [Inputs to OpenSTA](#ot_inputs)
  - [Constraints creation](#constraints)
  - [OpenSTA Run script](#ot_run)  
  
- [Day-2_Summary](#day-2-summary)
  
- [Day-2_Labs](#day-2-labs)
  - [Liberty Files and Understanding Lib Parsing](#liberty_files_and_understanding_lib_parsing)
  - [Understanding timing reports and timing graphs](#understanding_timing_reports_and_timing_graphs)
  
- [Day-3_Summary](#day-3-summary)
 
- [Day-3_Labs](#day-3-labs)
  - [Understanding full reg to reg STA analysis](#reg-sta)
  
- [Day-4_Summary](#day-4-summary)
  
- [Day-4_Labs](#day-4-labs)
  - [Understanding clock gating check](#understanding-clock-gating)
  - [Understanding Async pin checks](#understanding-async-check)
  
- [Day-5_Summary](#day-5-summary)

- [Day-5_Labs](#day-5-labs)
  - [CRPR](#crpr)
  - [ECO](#eco)
- [Acknowledgements:](#acknowledgements)
- [Author:](#author)

<!-- /code_chunk_output -->

---

# Day-1 Summary

Static timing analysis (STA) is a method of validating the timing performance of a design by checking all possible paths for timing violations. It involves analyzing the response time for each event in the circuit, and ensuring that all circuit timings meet their requirements

# Day-1 Labs

## OpenSTA Introduction

OpenSTA is a distributed software testing architecture designed around CORBA, it was originally developed to be commercial software by CYRANO. The current toolset has the capability of performing scripted HTTP and HTTPS heavy load tests with performance measurements from Win32 platforms. However, the architectural design means it could be capable of much more.

## Understanding basics of OpenSTA

![openSTA](https://storage.googleapis.com/stbstoragebucket/stb-reviews/2017/05/OpenSTA.jpg)

An STA tool takes design, standard cell, constraints as input and perform timing checks on the design. OpenSTA works on industry formats (e.g., .v, .spef, .lib, .sdc) and is designed to be parallel and portable.

## Inputs to OpenSTA

### The inputs to the opentimer are design, standard cells associated with the netlist and the constraints.
 
 ### The Netlist for the lab
 
![netlist](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day1/day_1_verilog.png)

 ### A typical example for the Library file also called .lib file. Here used open source Sky130
 
![Sky130](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day1/day_1_lib.png)

### A cell defined in a lib

![Sky130_NAND](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day1/day_1_lib_nand.png)

## Constraints creation

### The SDC file provided for the lab. This consists of the clock period, IO delays, input transition and capacitance delays. 
![sdc](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day1/day_1_sdc.png)

## OpenSTA Run script

![tcl](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day1/day_1_tcl.png)

### The timing checks

![max_voilated](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day1/day1_f1_out.png)

![max_met](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day1/day1_in_f1.png)

# Day-2 Summary

Apart from setup and hold checks, STA also has other timing checks in place like clock gating checks, async pin checks and data to data checks. We also make a note of the rise and fall slew transitions. We also have to provide load analysis by specifying min and max capacitances on the IO net, and corresponding fanout load on ports and output pins. The skew between launch and capture clock waveforms also needs to be taken into account, the skew is positive if the capture flop clock leads the launch flop clock. The duty cycle of the clock is limited by various parameters apart from the technology node. Latch based designs allow more flexibility in timing and also aids time borrowing. A typical STA text report contains startpoint, endpoint, 'max' signifies setup time check and the nodes in the design mentioned as paths, whose respective delays are taken into account.   

# Day-2 Labs

## Liberty Files and Understanding Lib Parsing
The .lib file is an ASCII representation of the timing and power
parameters associated with any cell in a particular semiconductor
technology The .lib file contains timing models and data to calculate I/O delay paths, Timing check values and Interconnect delays.

Exercises:

* ## Find all the cells in simple_max.lib.

  ![cells](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day2/cells.png)

  ### All cells are [here](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day2/cells_max.txt)

* ## Find all the pins of the cell NAND2_X1 in simple_max.lib
   ### Out Pin

   ![out_pin](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day2/pin1.png)

   ### In Pins

   ![in_pins](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day2/pin_a_pin_b.png)

* ## What difference you see between NAND2_X1 and NAND3_X1

   ### NAND2_X1 has 2 input pins whereas NAND3_X1 has 3 input pins

   ![in_pins](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day2/nand2_vs_nand3.png)

   ### The max capacitance increases multifold, and the number of input pins.

* ## What is the difference between ‘simple_max.lib’ and ‘simple_min.lib

  ### Fabrication process variations could either increase or decrease the delay of a cell. So we need to set early and late value while setting the derate factor. STA tool would consider early or late timing derate based on the path and type of analysis.

## Understanding timing reports and timing graphs.
### This is the timing report we have obtained from the netlist and other inputs being parsed into the OpenSTA tool.

![](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day2/min_path.png)

# Day-3_Summary

When we have multiple clocks, in STA, a possible common base period is choses, and a restrictive setup and hold check is followed. By default, the checks are restrictive in nature. The inclusion of falling edge clock on capture after positive edge on launching flop may lead to a half cycle period delay. Timing arcs consist of cell and net arcs. Combinational arcs go from input pins to the output pin, whereas sequential arcs consist of CLK->D arc (Setup/hold arc), CLK->OUT (Propagation delay) and CLK->RST (Recovery/Removal). We are also introduced to the concept of unateness and non-unateness. Cell delays are in general fuction of input transition and capacitive load. Clock latency can be from the source and towards the network. Unlike ideal clocks, real clocks have jitter which leads to uncertainty of the position of rising/falling edge.

# Day-3 Labs

## Understanding full reg to reg STA analysis
### Path 1

![path1](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day3/day3_path1.png)

### Path 2

![path2](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day3/day3_path2.png)

### Path 3

![path3](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day3/day3_path3.png)

### Path 4

![path4](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day3/day3_path4.png)

### Path 5

![path5](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day3/day3_path5.png)

### Path 6

![path6](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day3/day3_path6.png)
 
### Path 7

![path7](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day3/day3_path7.png)

### Path 8

![path8](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day3/day3_path8.png)

# Day-4_Summary

Crosstalk may lead to delta delays and glitches. Switching activity affected by coupling of aggresor and victim, leads to delta delay which may cause timing failure. Glitching is caused due to sudden charge transfer on a stable net which may cause functional failure. Variation could be inter-die and intra-die. The former is of global and systematic, and latter is of on-chip and random nature. In clock gating transition on gating pin, shouldn't create unnecessary active edge of the clock in the fanout. Async pin checks are needed to avoid unknown state. Recovery and removal time checks for assertion and deassertions need to be checked therefore.


# Day-4_Labs
  ## Understanding clock gating check
  ### A power-saving feature in semiconductor microelectronics called clock gating allows circuits to be turned off.
  
  ![clock gating](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day4/day4_clock_gating.png)

  ## Understanding Async pin checks
  
 ![asyn pins](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day4/day4_asyn_pin.png)

# Day-5_Summary

In Synchronous clocks, events happen at a fixed phase relation whereas in asynchronous clocks that is untrue. Then there are logically exclusive clocks, which are passed through a mux logic, whereas in physically exclusive clocks, the sources are entirely different. set_clock_groups is used for establishing asynchronous and synchronous pairs. We can provide different properties like latency, uncertainty, transition and sense. Path specification is done by providing -from -to and -through flags. We would need to be careful of false paths and multicycle paths too. There is a provision of providing max and min delay for a path too.

# Day-5_Labs
  ## Without CPPR
  ![without cppr](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day5/day5_cppr.png)

  ## CPPR
  ![ with cppr](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day5/day5_cppr_correct.png)

  ## ECO
  ### This circuit represenation is based on sev_eco.v
  ![ECO](https://github.com/avishekchoudhary/STA_Workshop/blob/main/day5/day5_eco.png)

## Acknowledgements

- [Kunal Ghosh](https://github.com/kunalg123), Co-founder of VLSI System Design (VSD) Corp. Pvt. Ltd.
- [Vikas Sachdeva](https://vlsideepdive.com/), Advisor, Tech and VLSI Coach, Trainer and Innovator at vlsideepdive.

## Author

[Avishek Choudhary](https:https://www.linkedin.com/in/avishekchoudhary/)
- Contact: achoudhary2_be19@thapar.edu <br>
