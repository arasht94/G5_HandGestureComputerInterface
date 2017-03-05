//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
//Date        : Mon Feb 27 22:12:27 2017
//Host        : ug153.eecg running 64-bit Debian GNU/Linux 8.7 (jessie)
//Command     : generate_target tb_3_wrapper.bd
//Design      : tb_3_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module tb_3_wrapper
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

  wire [23:0]M00_AXIS_tdata;
  wire M00_AXIS_tlast;
  wire M00_AXIS_tready;
  wire [2:0]M00_AXIS_tstrb;
  wire M00_AXIS_tvalid;
  wire [23:0]S00_AXIS_tdata;
  wire S00_AXIS_tlast;
  wire S00_AXIS_tready;
  wire [2:0]S00_AXIS_tstrb;
  wire S00_AXIS_tvalid;
  wire [4:0]S00_AXI_araddr;
  wire [2:0]S00_AXI_arprot;
  wire S00_AXI_arready;
  wire S00_AXI_arvalid;
  wire [4:0]S00_AXI_awaddr;
  wire [2:0]S00_AXI_awprot;
  wire S00_AXI_awready;
  wire S00_AXI_awvalid;
  wire S00_AXI_bready;
  wire [1:0]S00_AXI_bresp;
  wire S00_AXI_bvalid;
  wire [31:0]S00_AXI_rdata;
  wire S00_AXI_rready;
  wire [1:0]S00_AXI_rresp;
  wire S00_AXI_rvalid;
  wire [31:0]S00_AXI_wdata;
  wire S00_AXI_wready;
  wire [3:0]S00_AXI_wstrb;
  wire S00_AXI_wvalid;
  wire m00_axis_aclk;
  wire m00_axis_aresetn;

  tb_3 tb_3_i
       (.M00_AXIS_tdata(M00_AXIS_tdata),
        .M00_AXIS_tlast(M00_AXIS_tlast),
        .M00_AXIS_tready(M00_AXIS_tready),
        .M00_AXIS_tstrb(M00_AXIS_tstrb),
        .M00_AXIS_tvalid(M00_AXIS_tvalid),
        .S00_AXIS_tdata(S00_AXIS_tdata),
        .S00_AXIS_tlast(S00_AXIS_tlast),
        .S00_AXIS_tready(S00_AXIS_tready),
        .S00_AXIS_tstrb(S00_AXIS_tstrb),
        .S00_AXIS_tvalid(S00_AXIS_tvalid),
        .S00_AXI_araddr(S00_AXI_araddr),
        .S00_AXI_arprot(S00_AXI_arprot),
        .S00_AXI_arready(S00_AXI_arready),
        .S00_AXI_arvalid(S00_AXI_arvalid),
        .S00_AXI_awaddr(S00_AXI_awaddr),
        .S00_AXI_awprot(S00_AXI_awprot),
        .S00_AXI_awready(S00_AXI_awready),
        .S00_AXI_awvalid(S00_AXI_awvalid),
        .S00_AXI_bready(S00_AXI_bready),
        .S00_AXI_bresp(S00_AXI_bresp),
        .S00_AXI_bvalid(S00_AXI_bvalid),
        .S00_AXI_rdata(S00_AXI_rdata),
        .S00_AXI_rready(S00_AXI_rready),
        .S00_AXI_rresp(S00_AXI_rresp),
        .S00_AXI_rvalid(S00_AXI_rvalid),
        .S00_AXI_wdata(S00_AXI_wdata),
        .S00_AXI_wready(S00_AXI_wready),
        .S00_AXI_wstrb(S00_AXI_wstrb),
        .S00_AXI_wvalid(S00_AXI_wvalid),
        .m00_axis_aclk(m00_axis_aclk),
        .m00_axis_aresetn(m00_axis_aresetn));
endmodule
