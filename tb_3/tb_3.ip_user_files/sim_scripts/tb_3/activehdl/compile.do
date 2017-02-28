vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib -v2k5 \
"../../../../tb_3.srcs/sources_1/bd/tb_3/ipshared/user/led_detect_v1_0/hdl/led_detect_v1_0_S00_AXI.v" \
"../../../../tb_3.srcs/sources_1/bd/tb_3/ipshared/user/led_detect_v1_0/hdl/led_detect_v1_0_M00_AXIS.v" \
"../../../../tb_3.srcs/sources_1/bd/tb_3/ipshared/user/led_detect_v1_0/hdl/led_detect_v1_0_S00_AXIS.v" \
"../../../../tb_3.srcs/sources_1/bd/tb_3/ipshared/user/led_detect_v1_0/hdl/led_detect_v1_0.v" \
"../../../../tb_3.srcs/sources_1/bd/tb_3/ip/tb_3_led_detect_0_0/sim/tb_3_led_detect_0_0.v" \
"../../../../tb_3.srcs/sources_1/bd/tb_3/hdl/tb_3.v" \


vlog -work xil_defaultlib "glbl.v"

