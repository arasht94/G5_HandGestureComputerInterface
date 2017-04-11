vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../bd/tb_3/hdl/tb_3.v" \
"../../../bd/tb_3/ipshared/user/led_detect_v1_0/hdl/led_detect_v1_0_S00_AXI.v" \
"../../../bd/tb_3/ipshared/user/led_detect_v1_0/hdl/led_detect_v1_0_M00_AXIS.v" \
"../../../bd/tb_3/ipshared/user/led_detect_v1_0/hdl/led_detect_v1_0_S00_AXIS.v" \
"../../../bd/tb_3/ipshared/user/led_detect_v1_0/hdl/led_detect_v1_0.v" \
"../../../bd/tb_3/ip/tb_3_led_detect_0_1/sim/tb_3_led_detect_0_1.v" \


vlog -work xil_defaultlib "glbl.v"
