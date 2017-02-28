//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
//Date        : Mon Feb 27 21:39:53 2017
//Host        : ug153.eecg running 64-bit Debian GNU/Linux 8.7 (jessie)
//Command     : generate_target tb_3.bd
//Design      : tb_3
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "tb_3,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=tb_3,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "tb_3.hwdef" *) 
module tb_3
   (M00_AXIS_tdata,
    M00_AXIS_tlast,
    M00_AXIS_tready,
    M00_AXIS_tstrb,
    M00_AXIS_tvalid,
    S00_AXIS_tdata,
    S00_AXIS_tlast,
    S00_AXIS_tready,
    S00_AXIS_tstrb,
    S00_AXIS_tvalid,
    S00_AXI_araddr,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awprot,
    S00_AXI_awready,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid,
    m00_axis_aclk,
    m00_axis_aresetn);
  output [23:0]M00_AXIS_tdata;
  output M00_AXIS_tlast;
  input M00_AXIS_tready;
  output [2:0]M00_AXIS_tstrb;
  output M00_AXIS_tvalid;
  input [23:0]S00_AXIS_tdata;
  input S00_AXIS_tlast;
  output S00_AXIS_tready;
  input [2:0]S00_AXIS_tstrb;
  input S00_AXIS_tvalid;
  input [4:0]S00_AXI_araddr;
  input [2:0]S00_AXI_arprot;
  output S00_AXI_arready;
  input S00_AXI_arvalid;
  input [4:0]S00_AXI_awaddr;
  input [2:0]S00_AXI_awprot;
  output S00_AXI_awready;
  input S00_AXI_awvalid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;
  input m00_axis_aclk;
  input m00_axis_aresetn;

  wire [23:0]S00_AXIS_1_TDATA;
  wire S00_AXIS_1_TLAST;
  wire S00_AXIS_1_TREADY;
  wire [2:0]S00_AXIS_1_TSTRB;
  wire S00_AXIS_1_TVALID;
  wire [4:0]S00_AXI_1_ARADDR;
  wire [2:0]S00_AXI_1_ARPROT;
  wire S00_AXI_1_ARREADY;
  wire S00_AXI_1_ARVALID;
  wire [4:0]S00_AXI_1_AWADDR;
  wire [2:0]S00_AXI_1_AWPROT;
  wire S00_AXI_1_AWREADY;
  wire S00_AXI_1_AWVALID;
  wire S00_AXI_1_BREADY;
  wire [1:0]S00_AXI_1_BRESP;
  wire S00_AXI_1_BVALID;
  wire [31:0]S00_AXI_1_RDATA;
  wire S00_AXI_1_RREADY;
  wire [1:0]S00_AXI_1_RRESP;
  wire S00_AXI_1_RVALID;
  wire [31:0]S00_AXI_1_WDATA;
  wire S00_AXI_1_WREADY;
  wire [3:0]S00_AXI_1_WSTRB;
  wire S00_AXI_1_WVALID;
  wire [23:0]led_detect_0_M00_AXIS_TDATA;
  wire led_detect_0_M00_AXIS_TLAST;
  wire led_detect_0_M00_AXIS_TREADY;
  wire [2:0]led_detect_0_M00_AXIS_TSTRB;
  wire led_detect_0_M00_AXIS_TVALID;
  wire m00_axis_aclk_1;
  wire m00_axis_aresetn_1;

  assign M00_AXIS_tdata[23:0] = led_detect_0_M00_AXIS_TDATA;
  assign M00_AXIS_tlast = led_detect_0_M00_AXIS_TLAST;
  assign M00_AXIS_tstrb[2:0] = led_detect_0_M00_AXIS_TSTRB;
  assign M00_AXIS_tvalid = led_detect_0_M00_AXIS_TVALID;
  assign S00_AXIS_1_TDATA = S00_AXIS_tdata[23:0];
  assign S00_AXIS_1_TLAST = S00_AXIS_tlast;
  assign S00_AXIS_1_TSTRB = S00_AXIS_tstrb[2:0];
  assign S00_AXIS_1_TVALID = S00_AXIS_tvalid;
  assign S00_AXIS_tready = S00_AXIS_1_TREADY;
  assign S00_AXI_1_ARADDR = S00_AXI_araddr[4:0];
  assign S00_AXI_1_ARPROT = S00_AXI_arprot[2:0];
  assign S00_AXI_1_ARVALID = S00_AXI_arvalid;
  assign S00_AXI_1_AWADDR = S00_AXI_awaddr[4:0];
  assign S00_AXI_1_AWPROT = S00_AXI_awprot[2:0];
  assign S00_AXI_1_AWVALID = S00_AXI_awvalid;
  assign S00_AXI_1_BREADY = S00_AXI_bready;
  assign S00_AXI_1_RREADY = S00_AXI_rready;
  assign S00_AXI_1_WDATA = S00_AXI_wdata[31:0];
  assign S00_AXI_1_WSTRB = S00_AXI_wstrb[3:0];
  assign S00_AXI_1_WVALID = S00_AXI_wvalid;
  assign S00_AXI_arready = S00_AXI_1_ARREADY;
  assign S00_AXI_awready = S00_AXI_1_AWREADY;
  assign S00_AXI_bresp[1:0] = S00_AXI_1_BRESP;
  assign S00_AXI_bvalid = S00_AXI_1_BVALID;
  assign S00_AXI_rdata[31:0] = S00_AXI_1_RDATA;
  assign S00_AXI_rresp[1:0] = S00_AXI_1_RRESP;
  assign S00_AXI_rvalid = S00_AXI_1_RVALID;
  assign S00_AXI_wready = S00_AXI_1_WREADY;
  assign led_detect_0_M00_AXIS_TREADY = M00_AXIS_tready;
  assign m00_axis_aclk_1 = m00_axis_aclk;
  assign m00_axis_aresetn_1 = m00_axis_aresetn;
  tb_3_led_detect_0_1 led_detect_0
       (.m00_axis_aclk(m00_axis_aclk_1),
        .m00_axis_aresetn(m00_axis_aresetn_1),
        .m00_axis_tdata(led_detect_0_M00_AXIS_TDATA),
        .m00_axis_tlast(led_detect_0_M00_AXIS_TLAST),
        .m00_axis_tready(led_detect_0_M00_AXIS_TREADY),
        .m00_axis_tstrb(led_detect_0_M00_AXIS_TSTRB),
        .m00_axis_tvalid(led_detect_0_M00_AXIS_TVALID),
        .s00_axi_aclk(m00_axis_aclk_1),
        .s00_axi_araddr(S00_AXI_1_ARADDR),
        .s00_axi_aresetn(m00_axis_aresetn_1),
        .s00_axi_arprot(S00_AXI_1_ARPROT),
        .s00_axi_arready(S00_AXI_1_ARREADY),
        .s00_axi_arvalid(S00_AXI_1_ARVALID),
        .s00_axi_awaddr(S00_AXI_1_AWADDR),
        .s00_axi_awprot(S00_AXI_1_AWPROT),
        .s00_axi_awready(S00_AXI_1_AWREADY),
        .s00_axi_awvalid(S00_AXI_1_AWVALID),
        .s00_axi_bready(S00_AXI_1_BREADY),
        .s00_axi_bresp(S00_AXI_1_BRESP),
        .s00_axi_bvalid(S00_AXI_1_BVALID),
        .s00_axi_rdata(S00_AXI_1_RDATA),
        .s00_axi_rready(S00_AXI_1_RREADY),
        .s00_axi_rresp(S00_AXI_1_RRESP),
        .s00_axi_rvalid(S00_AXI_1_RVALID),
        .s00_axi_wdata(S00_AXI_1_WDATA),
        .s00_axi_wready(S00_AXI_1_WREADY),
        .s00_axi_wstrb(S00_AXI_1_WSTRB),
        .s00_axi_wvalid(S00_AXI_1_WVALID),
        .s00_axis_aclk(m00_axis_aclk_1),
        .s00_axis_aresetn(m00_axis_aresetn_1),
        .s00_axis_tdata(S00_AXIS_1_TDATA),
        .s00_axis_tlast(S00_AXIS_1_TLAST),
        .s00_axis_tready(S00_AXIS_1_TREADY),
        .s00_axis_tstrb(S00_AXIS_1_TSTRB),
        .s00_axis_tvalid(S00_AXIS_1_TVALID));
endmodule
