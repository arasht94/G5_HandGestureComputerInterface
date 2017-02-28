@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim tb_3_wrapper_behav -key {Behavioral:sim_2:Functional:tb_3_wrapper} -tclbatch tb_3_wrapper.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
