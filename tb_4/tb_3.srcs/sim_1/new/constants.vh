`ifndef _constants_vh_
`define _constants_vh_

//1280x720
//`define IMAGE_WIDTH 30720
`define IMAGE_HEIGHT 921618
`define IMAGE_DEPTH 24

//54 Bytes
`define BMP_HEADER 432 
 
`define HEIGHT_COUNTER 30

`define S_AXI tb.ip_dut.led_detect_0.inst.led_detect_v1_0_S00_AXI_inst
`define M_AXI tb.ip_dut.led_detect_0.inst.led_detect_v1_0_M00_AXIS_inst
`define S_AXIS tb.ip_dut.led_detect_0.inst.led_detect_v1_0_S00_AXIS_inst

`define SIM_TIME 20000000

`endif