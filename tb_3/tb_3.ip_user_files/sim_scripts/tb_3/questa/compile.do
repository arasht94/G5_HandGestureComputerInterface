vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../../tb_3.srcs/sources_1/bd/tb_3/ipshared/user/led_detect_v1_0/hdl/led_detect_v1_0_S00_AXI.v" \
"../../../../tb_3.srcs/sources_1/bd/tb_3/ipshared/user/led_detect_v1_0/hdl/led_detect_v1_0_M00_AXIS.v" \
"../../../../tb_3.srcs/sources_1/bd/tb_3/ipshared/user/led_detect_v1_0/hdl/led_detect_v1_0_S00_AXIS.v" \
"../../../../tb_3.srcs/sources_1/bd/tb_3/ipshared/user/led_detect_v1_0/hdl/led_detect_v1_0.v" \
"../../../../tb_3.srcs/sources_1/bd/tb_3/ip/tb_3_led_detect_0_0/sim/tb_3_led_detect_0_0.v" \
"../../../../tb_3.srcs/sources_1/bd/tb_3/hdl/tb_3.v" \


vlog -work xil_defaultlib "glbl.v"

