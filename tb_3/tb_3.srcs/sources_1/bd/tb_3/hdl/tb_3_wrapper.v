//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Mon Feb 27 20:55:58 2017
//Host        : SFB520WS16 running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target tb_3_wrapper.bd
//Design      : tb_3_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module tb_3_wrapper
   (m00_axis_aclk,
    m00_axis_aresetn);
  input m00_axis_aclk;
  input m00_axis_aresetn;

  wire m00_axis_aclk;
  wire m00_axis_aresetn;

  tb_3 tb_3_i
       (.m00_axis_aclk(m00_axis_aclk),
        .m00_axis_aresetn(m00_axis_aresetn));
endmodule
