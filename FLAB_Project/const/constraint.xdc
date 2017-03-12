set_property PACKAGE_PIN W5 [get_ports clk]
          set_property IOSTANDARD LVCMOS33 [get_ports clk]
          create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk] 

 set_property PACKAGE_PIN A14 [get_ports {rowsOut[0]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {rowsOut[0]}] 
##Sch name = JB2 
set_property PACKAGE_PIN A16 [get_ports {rowsOut[1]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {rowsOut[1]}] 
##Sch name = JB3 
set_property PACKAGE_PIN B15 [get_ports {rowsOut[2]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {rowsOut[2]}] 
set_property PACKAGE_PIN B16 [get_ports {rowsOut[3]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {rowsOut[3]}] 
##Sch name = JB7 
set_property PACKAGE_PIN A15 [get_ports {rowsOut[4]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {rowsOut[4]}] 
##Sch name = JB8 
set_property PACKAGE_PIN A17 [get_ports {rowsOut[5]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {rowsOut[5]}] 
##Sch name = JB9 
set_property PACKAGE_PIN C15 [get_ports {rowsOut[6]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {rowsOut[6]}] 
##Sch name = JB10  
set_property PACKAGE_PIN C16 [get_ports {rowsOut[7]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {rowsOut[7]}] 
  
##Pmod Header JC 
##Sch name = JC1 
set_property PACKAGE_PIN K17 [get_ports {ds}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {ds}] 
##Sch name = JC2 
set_property PACKAGE_PIN M18 [get_ports {oe}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {oe}] 
##Sch name = JC3 
set_property PACKAGE_PIN N17 [get_ports {stcp}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {stcp}] 
##Sch name = JC4 
set_property PACKAGE_PIN P18 [get_ports {shcp}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {shcp}] 
##Sch name = JC7 
set_property PACKAGE_PIN L17 [get_ports {mr}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {mr}] 
##Sch name = JC8 


#leds
set_property PACKAGE_PIN L1 [get_ports {progressBar[0]}] 	 	 	 	 	 
 	      set_property IOSTANDARD LVCMOS33 [get_ports {progressBar[0]}]	      
set_property PACKAGE_PIN P1 [get_ports {progressBar[1]}] 	 	 	 	 	 
          set_property IOSTANDARD LVCMOS33 [get_ports {progressBar[1]}]
set_property PACKAGE_PIN N3 [get_ports {progressBar[2]}] 	 	 	 	 	 
          set_property IOSTANDARD LVCMOS33 [get_ports {progressBar[2]}]
set_property PACKAGE_PIN P3 [get_ports {progressBar[3]}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {progressBar[3]}]          
set_property PACKAGE_PIN U3 [get_ports {progressBar[4]}] 	 	 	 	 	 
          set_property IOSTANDARD LVCMOS33 [get_ports {progressBar[4]}]
set_property PACKAGE_PIN W3 [get_ports {progressBar[5]}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {progressBar[5]}]
set_property PACKAGE_PIN V3 [get_ports {progressBar[6]}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {progressBar[6]}]
set_property PACKAGE_PIN V13 [get_ports {progressBar[7]}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {progressBar[7]}]                
set_property PACKAGE_PIN V14 [get_ports {progressBar[8]}] 	 	 	 	 	 
          set_property IOSTANDARD LVCMOS33 [get_ports {progressBar[8]}]
set_property PACKAGE_PIN U14 [get_ports {progressBar[9]}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {progressBar[9]}]
set_property PACKAGE_PIN U15 [get_ports {progressBar[10]}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {progressBar[10]}]
set_property PACKAGE_PIN W18 [get_ports {progressBar[11]}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {progressBar[11]}]          
set_property PACKAGE_PIN V19 [get_ports {progressBar[12]}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {progressBar[12]}]
set_property PACKAGE_PIN U19 [get_ports {progressBar[13]}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {progressBar[13]}]
set_property PACKAGE_PIN E19 [get_ports {progressBar[14]}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {progressBar[14]}]             
set_property PACKAGE_PIN U16 [get_ports {progressBar[15]}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {progressBar[15]}] 
#pushbuttons
set_property PACKAGE_PIN T18 [get_ports buttonIn]
          set_property IOSTANDARD LVCMOS33 [get_ports buttonIn]
set_property PACKAGE_PIN U18 [get_ports start]
          set_property IOSTANDARD LVCMOS33 [get_ports start]
#switches 
 
set_property PACKAGE_PIN V17 [get_ports {cont}] 	 	 	 	 	 
         set_property IOSTANDARD LVCMOS33 [get_ports {cont}]   
set_property PACKAGE_PIN V16 [get_ports {mode}] 	 	 	 	 	 
         set_property IOSTANDARD LVCMOS33 [get_ports {mode}]   
set_property PACKAGE_PIN W16 [get_ports {art}] 	 	 	 	 	 
         set_property IOSTANDARD LVCMOS33 [get_ports {art}]   
set_property PACKAGE_PIN R2 [get_ports {difficultyLevel[1]}] 	 	 	 	 	 
         set_property IOSTANDARD LVCMOS33 [get_ports {difficultyLevel[1]}]                      
set_property PACKAGE_PIN T1 [get_ports {difficultyLevel[0]}]                          
         set_property IOSTANDARD LVCMOS33 [get_ports {difficultyLevel[0]}]
#7 segment display
set_property PACKAGE_PIN W7 [get_ports {a}]
        set_property IOSTANDARD LVCMOS33 [get_ports {a}]
set_property PACKAGE_PIN W6 [get_ports {b}]
        set_property IOSTANDARD LVCMOS33 [get_ports {b}]
set_property PACKAGE_PIN U8 [get_ports {c}]
        set_property IOSTANDARD LVCMOS33 [get_ports {c}]
set_property PACKAGE_PIN V8 [get_ports {d}]
        set_property IOSTANDARD LVCMOS33 [get_ports {d}]
set_property PACKAGE_PIN U5 [get_ports {e}]
        set_property IOSTANDARD LVCMOS33 [get_ports {e}]
set_property PACKAGE_PIN V5 [get_ports {f}]
        set_property IOSTANDARD LVCMOS33 [get_ports {f}]
set_property PACKAGE_PIN U7 [get_ports {g}]
        set_property IOSTANDARD LVCMOS33 [get_ports {g}]
set_property PACKAGE_PIN V7 [get_ports dp]
        set_property IOSTANDARD LVCMOS33 [get_ports dp]
set_property PACKAGE_PIN U2 [get_ports {an[0]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]             
         

