//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Mon Feb 27 20:55:58 2017
//Host        : SFB520WS16 running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target tb_3.bd
//Design      : tb_3
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "tb_3,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=tb_3,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "tb_3.hwdef" *) 
module tb_3
   (m00_axis_aclk,
    m00_axis_aresetn);
  input m00_axis_aclk;
  input m00_axis_aresetn;

  wire m00_axis_aclk_1;
  wire m00_axis_aresetn_1;

  assign m00_axis_aclk_1 = m00_axis_aclk;
  assign m00_axis_aresetn_1 = m00_axis_aresetn;
  tb_3_led_detect_0_1 led_detect_0
       (.m00_axis_aclk(m00_axis_aclk_1),
        .m00_axis_aresetn(m00_axis_aresetn_1),
        .m00_axis_tready(1'b0),
        .s00_axi_aclk(m00_axis_aclk_1),
        .s00_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s00_axi_aresetn(m00_axis_aresetn_1),
        .s00_axi_arprot({1'b0,1'b0,1'b0}),
        .s00_axi_arvalid(1'b0),
        .s00_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s00_axi_awprot({1'b0,1'b0,1'b0}),
        .s00_axi_awvalid(1'b0),
        .s00_axi_bready(1'b0),
        .s00_axi_rready(1'b0),
        .s00_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s00_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s00_axi_wvalid(1'b0),
        .s00_axis_aclk(m00_axis_aclk_1),
        .s00_axis_aresetn(m00_axis_aresetn_1),
        .s00_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s00_axis_tlast(1'b0),
        .s00_axis_tstrb({1'b0,1'b0,1'b0}),
        .s00_axis_tvalid(1'b0));
endmodule
