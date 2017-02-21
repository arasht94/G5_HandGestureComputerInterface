//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Tue Feb 21 12:39:47 2017
//Host        : SFB520WS15 running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_mb_cnt=2,synth_mode=Global}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arid,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_aruser,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awid,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awuser,
    M00_AXI_awvalid,
    M00_AXI_bid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_buser,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rid,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_ruser,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wuser,
    M00_AXI_wvalid,
    m00_axi_aclk,
    m00_axi_aresetn,
    m00_axi_error,
    m00_axi_init_axi_txn,
    m00_axi_txn_done);
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [0:0]M00_AXI_arid;
  output [7:0]M00_AXI_arlen;
  output M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output [0:0]M00_AXI_aruser;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [0:0]M00_AXI_awid;
  output [7:0]M00_AXI_awlen;
  output M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output [0:0]M00_AXI_awuser;
  output M00_AXI_awvalid;
  input [0:0]M00_AXI_bid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input [0:0]M00_AXI_buser;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  input [0:0]M00_AXI_rid;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input [0:0]M00_AXI_ruser;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output [0:0]M00_AXI_wuser;
  output M00_AXI_wvalid;
  input m00_axi_aclk;
  input m00_axi_aresetn;
  output m00_axi_error;
  input m00_axi_init_axi_txn;
  output m00_axi_txn_done;

  wire [31:0]IP_Core_0_M00_AXI_ARADDR;
  wire [1:0]IP_Core_0_M00_AXI_ARBURST;
  wire [3:0]IP_Core_0_M00_AXI_ARCACHE;
  wire [0:0]IP_Core_0_M00_AXI_ARID;
  wire [7:0]IP_Core_0_M00_AXI_ARLEN;
  wire IP_Core_0_M00_AXI_ARLOCK;
  wire [2:0]IP_Core_0_M00_AXI_ARPROT;
  wire [3:0]IP_Core_0_M00_AXI_ARQOS;
  wire IP_Core_0_M00_AXI_ARREADY;
  wire [2:0]IP_Core_0_M00_AXI_ARSIZE;
  wire [0:0]IP_Core_0_M00_AXI_ARUSER;
  wire IP_Core_0_M00_AXI_ARVALID;
  wire [31:0]IP_Core_0_M00_AXI_AWADDR;
  wire [1:0]IP_Core_0_M00_AXI_AWBURST;
  wire [3:0]IP_Core_0_M00_AXI_AWCACHE;
  wire [0:0]IP_Core_0_M00_AXI_AWID;
  wire [7:0]IP_Core_0_M00_AXI_AWLEN;
  wire IP_Core_0_M00_AXI_AWLOCK;
  wire [2:0]IP_Core_0_M00_AXI_AWPROT;
  wire [3:0]IP_Core_0_M00_AXI_AWQOS;
  wire IP_Core_0_M00_AXI_AWREADY;
  wire [2:0]IP_Core_0_M00_AXI_AWSIZE;
  wire [0:0]IP_Core_0_M00_AXI_AWUSER;
  wire IP_Core_0_M00_AXI_AWVALID;
  wire [0:0]IP_Core_0_M00_AXI_BID;
  wire IP_Core_0_M00_AXI_BREADY;
  wire [1:0]IP_Core_0_M00_AXI_BRESP;
  wire [0:0]IP_Core_0_M00_AXI_BUSER;
  wire IP_Core_0_M00_AXI_BVALID;
  wire [31:0]IP_Core_0_M00_AXI_RDATA;
  wire [0:0]IP_Core_0_M00_AXI_RID;
  wire IP_Core_0_M00_AXI_RLAST;
  wire IP_Core_0_M00_AXI_RREADY;
  wire [1:0]IP_Core_0_M00_AXI_RRESP;
  wire [0:0]IP_Core_0_M00_AXI_RUSER;
  wire IP_Core_0_M00_AXI_RVALID;
  wire [31:0]IP_Core_0_M00_AXI_WDATA;
  wire IP_Core_0_M00_AXI_WLAST;
  wire IP_Core_0_M00_AXI_WREADY;
  wire [3:0]IP_Core_0_M00_AXI_WSTRB;
  wire [0:0]IP_Core_0_M00_AXI_WUSER;
  wire IP_Core_0_M00_AXI_WVALID;
  wire IP_Core_0_m00_axi_error;
  wire IP_Core_0_m00_axi_txn_done;
  wire m00_axi_aclk_1;
  wire m00_axi_aresetn_1;
  wire m00_axi_init_axi_txn_1;

  assign IP_Core_0_M00_AXI_ARREADY = M00_AXI_arready;
  assign IP_Core_0_M00_AXI_AWREADY = M00_AXI_awready;
  assign IP_Core_0_M00_AXI_BID = M00_AXI_bid[0];
  assign IP_Core_0_M00_AXI_BRESP = M00_AXI_bresp[1:0];
  assign IP_Core_0_M00_AXI_BUSER = M00_AXI_buser[0];
  assign IP_Core_0_M00_AXI_BVALID = M00_AXI_bvalid;
  assign IP_Core_0_M00_AXI_RDATA = M00_AXI_rdata[31:0];
  assign IP_Core_0_M00_AXI_RID = M00_AXI_rid[0];
  assign IP_Core_0_M00_AXI_RLAST = M00_AXI_rlast;
  assign IP_Core_0_M00_AXI_RRESP = M00_AXI_rresp[1:0];
  assign IP_Core_0_M00_AXI_RUSER = M00_AXI_ruser[0];
  assign IP_Core_0_M00_AXI_RVALID = M00_AXI_rvalid;
  assign IP_Core_0_M00_AXI_WREADY = M00_AXI_wready;
  assign M00_AXI_araddr[31:0] = IP_Core_0_M00_AXI_ARADDR;
  assign M00_AXI_arburst[1:0] = IP_Core_0_M00_AXI_ARBURST;
  assign M00_AXI_arcache[3:0] = IP_Core_0_M00_AXI_ARCACHE;
  assign M00_AXI_arid[0] = IP_Core_0_M00_AXI_ARID;
  assign M00_AXI_arlen[7:0] = IP_Core_0_M00_AXI_ARLEN;
  assign M00_AXI_arlock = IP_Core_0_M00_AXI_ARLOCK;
  assign M00_AXI_arprot[2:0] = IP_Core_0_M00_AXI_ARPROT;
  assign M00_AXI_arqos[3:0] = IP_Core_0_M00_AXI_ARQOS;
  assign M00_AXI_arsize[2:0] = IP_Core_0_M00_AXI_ARSIZE;
  assign M00_AXI_aruser[0] = IP_Core_0_M00_AXI_ARUSER;
  assign M00_AXI_arvalid = IP_Core_0_M00_AXI_ARVALID;
  assign M00_AXI_awaddr[31:0] = IP_Core_0_M00_AXI_AWADDR;
  assign M00_AXI_awburst[1:0] = IP_Core_0_M00_AXI_AWBURST;
  assign M00_AXI_awcache[3:0] = IP_Core_0_M00_AXI_AWCACHE;
  assign M00_AXI_awid[0] = IP_Core_0_M00_AXI_AWID;
  assign M00_AXI_awlen[7:0] = IP_Core_0_M00_AXI_AWLEN;
  assign M00_AXI_awlock = IP_Core_0_M00_AXI_AWLOCK;
  assign M00_AXI_awprot[2:0] = IP_Core_0_M00_AXI_AWPROT;
  assign M00_AXI_awqos[3:0] = IP_Core_0_M00_AXI_AWQOS;
  assign M00_AXI_awsize[2:0] = IP_Core_0_M00_AXI_AWSIZE;
  assign M00_AXI_awuser[0] = IP_Core_0_M00_AXI_AWUSER;
  assign M00_AXI_awvalid = IP_Core_0_M00_AXI_AWVALID;
  assign M00_AXI_bready = IP_Core_0_M00_AXI_BREADY;
  assign M00_AXI_rready = IP_Core_0_M00_AXI_RREADY;
  assign M00_AXI_wdata[31:0] = IP_Core_0_M00_AXI_WDATA;
  assign M00_AXI_wlast = IP_Core_0_M00_AXI_WLAST;
  assign M00_AXI_wstrb[3:0] = IP_Core_0_M00_AXI_WSTRB;
  assign M00_AXI_wuser[0] = IP_Core_0_M00_AXI_WUSER;
  assign M00_AXI_wvalid = IP_Core_0_M00_AXI_WVALID;
  assign m00_axi_aclk_1 = m00_axi_aclk;
  assign m00_axi_aresetn_1 = m00_axi_aresetn;
  assign m00_axi_error = IP_Core_0_m00_axi_error;
  assign m00_axi_init_axi_txn_1 = m00_axi_init_axi_txn;
  assign m00_axi_txn_done = IP_Core_0_m00_axi_txn_done;
  design_1_IP_Core_0_1 IP_Core_0
       (.m00_axi_aclk(m00_axi_aclk_1),
        .m00_axi_araddr(IP_Core_0_M00_AXI_ARADDR),
        .m00_axi_arburst(IP_Core_0_M00_AXI_ARBURST),
        .m00_axi_arcache(IP_Core_0_M00_AXI_ARCACHE),
        .m00_axi_aresetn(m00_axi_aresetn_1),
        .m00_axi_arid(IP_Core_0_M00_AXI_ARID),
        .m00_axi_arlen(IP_Core_0_M00_AXI_ARLEN),
        .m00_axi_arlock(IP_Core_0_M00_AXI_ARLOCK),
        .m00_axi_arprot(IP_Core_0_M00_AXI_ARPROT),
        .m00_axi_arqos(IP_Core_0_M00_AXI_ARQOS),
        .m00_axi_arready(IP_Core_0_M00_AXI_ARREADY),
        .m00_axi_arsize(IP_Core_0_M00_AXI_ARSIZE),
        .m00_axi_aruser(IP_Core_0_M00_AXI_ARUSER),
        .m00_axi_arvalid(IP_Core_0_M00_AXI_ARVALID),
        .m00_axi_awaddr(IP_Core_0_M00_AXI_AWADDR),
        .m00_axi_awburst(IP_Core_0_M00_AXI_AWBURST),
        .m00_axi_awcache(IP_Core_0_M00_AXI_AWCACHE),
        .m00_axi_awid(IP_Core_0_M00_AXI_AWID),
        .m00_axi_awlen(IP_Core_0_M00_AXI_AWLEN),
        .m00_axi_awlock(IP_Core_0_M00_AXI_AWLOCK),
        .m00_axi_awprot(IP_Core_0_M00_AXI_AWPROT),
        .m00_axi_awqos(IP_Core_0_M00_AXI_AWQOS),
        .m00_axi_awready(IP_Core_0_M00_AXI_AWREADY),
        .m00_axi_awsize(IP_Core_0_M00_AXI_AWSIZE),
        .m00_axi_awuser(IP_Core_0_M00_AXI_AWUSER),
        .m00_axi_awvalid(IP_Core_0_M00_AXI_AWVALID),
        .m00_axi_bid(IP_Core_0_M00_AXI_BID),
        .m00_axi_bready(IP_Core_0_M00_AXI_BREADY),
        .m00_axi_bresp(IP_Core_0_M00_AXI_BRESP),
        .m00_axi_buser(IP_Core_0_M00_AXI_BUSER),
        .m00_axi_bvalid(IP_Core_0_M00_AXI_BVALID),
        .m00_axi_error(IP_Core_0_m00_axi_error),
        .m00_axi_init_axi_txn(m00_axi_init_axi_txn_1),
        .m00_axi_rdata(IP_Core_0_M00_AXI_RDATA),
        .m00_axi_rid(IP_Core_0_M00_AXI_RID),
        .m00_axi_rlast(IP_Core_0_M00_AXI_RLAST),
        .m00_axi_rready(IP_Core_0_M00_AXI_RREADY),
        .m00_axi_rresp(IP_Core_0_M00_AXI_RRESP),
        .m00_axi_ruser(IP_Core_0_M00_AXI_RUSER),
        .m00_axi_rvalid(IP_Core_0_M00_AXI_RVALID),
        .m00_axi_txn_done(IP_Core_0_m00_axi_txn_done),
        .m00_axi_wdata(IP_Core_0_M00_AXI_WDATA),
        .m00_axi_wlast(IP_Core_0_M00_AXI_WLAST),
        .m00_axi_wready(IP_Core_0_M00_AXI_WREADY),
        .m00_axi_wstrb(IP_Core_0_M00_AXI_WSTRB),
        .m00_axi_wuser(IP_Core_0_M00_AXI_WUSER),
        .m00_axi_wvalid(IP_Core_0_M00_AXI_WVALID));
endmodule
