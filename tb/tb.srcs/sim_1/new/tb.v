`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2017 12:39:34 PM
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb();
    //Define wires
    wire [31:0] tb_M00_AXI_araddr;
    wire [1:0] tb_M00_AXI_arburst;
    wire [3:0] tb_M00_AXI_arcache;
    wire [0:0] tb_M00_AXI_arid;
    wire [7:0] tb_M00_AXI_arlen;
    wire tb_M00_AXI_arlock;
    wire [2:0] tb_M00_AXI_arprot;
    wire [3:0] tb_M00_AXI_arqos;
    wire tb_M00_AXI_arready;
    wire [2:0] tb_M00_AXI_arsize;
    wire [0:0] tb_M00_AXI_aruser;
    wire tb_M00_AXI_arvalid;
    wire [31:0] tb_M00_AXI_awaddr;
    wire [1:0] tb_M00_AXI_awburst;
    wire [3:0] tb_M00_AXI_awcache;
    wire [0:0] tb_M00_AXI_awid;
    wire [7:0] tb_M00_AXI_awlen;
    wire tb_M00_AXI_awlock;
    wire [2:0] tb_M00_AXI_awprot;
    wire [3:0] tb_M00_AXI_awqos;
    wire tb_M00_AXI_awready;
    wire [2:0] tb_M00_AXI_awsize;
    wire [0:0] tb_M00_AXI_awuser;
    wire tb_M00_AXI_awvalid;
    wire [0:0] tb_M00_AXI_bid;
    wire tb_M00_AXI_bready;
    wire [1:0] tb_M00_AXI_bresp;
    wire [0:0] tb_M00_AXI_buser;
    wire tb_M00_AXI_bvalid;
    wire [31:0] tb_M00_AXI_rdata;
    wire [0:0] tb_M00_AXI_rid;
    wire tb_M00_AXI_rlast;
    wire tb_M00_AXI_rready;
    wire [1:0] tb_M00_AXI_rresp;
    wire [0:0] tb_M00_AXI_ruser;
    wire tb_M00_AXI_rvalid;
    wire [31:0] tb_M00_AXI_wdata;
    wire tb_M00_AXI_wlast;
    wire tb_M00_AXI_wready;
    wire [3:0] tb_M00_AXI_wstrb;
    wire [0:0] tb_M00_AXI_wuser;
    wire tb_M00_AXI_wvalid;
    wire tb_m00_axi_aclk;
    wire tb_m00_axi_aresetn;
    wire tb_m00_axi_error;
    wire tb_m00_axi_init_axi_txn;
    wire tb_m00_axi_txn_done;  
    
    
    //instantiate the DUT
    design_1 ip_dut (
        .M00_AXI_araddr(tb_M00_AXI_araddr),
        .M00_AXI_arburst(tb_M00_AXI_arburst),
        .M00_AXI_arcache(tb_M00_AXI_arcache),
        .M00_AXI_arid(tb_M00_AXI_arid),
        .M00_AXI_arlen(tb_M00_AXI_arlen),
        .M00_AXI_arlock(tb_M00_AXI_arlock),
        .M00_AXI_arprot(tb_M00_AXI_arprot),
        .M00_AXI_arqos(tb_M00_AXI_arqos),
        .M00_AXI_arready(tb_M00_AXI_arready),
        .M00_AXI_arsize(tb_M00_AXI_arsize),
        .M00_AXI_aruser(tb_M00_AXI_aruser),
        .M00_AXI_arvalid(tb_M00_AXI_arvalid),
        .M00_AXI_awaddr(tb_M00_AXI_awaddr),
        .M00_AXI_awburst(tb_M00_AXI_awburst),
        .M00_AXI_awcache(tb_M00_AXI_awcache),
        .M00_AXI_awid(tb_M00_AXI_awid),
        .M00_AXI_awlen(tb_M00_AXI_awlen),
        .M00_AXI_awlock(tb_M00_AXI_awlock),
        .M00_AXI_awprot(tb_M00_AXI_awprot),
        .M00_AXI_awqos(tb_M00_AXI_awqos),
        .M00_AXI_awready(tb_M00_AXI_awready),
        .M00_AXI_awsize(tb_M00_AXI_awsize),
        .M00_AXI_awuser(tb_M00_AXI_awuser),
        .M00_AXI_awvalid(tb_M00_AXI_awvalid),
        .M00_AXI_bid(tb_M00_AXI_bid),
        .M00_AXI_bready(tb_M00_AXI_bready),
        .M00_AXI_bresp(tb_M00_AXI_bresp),
        .M00_AXI_buser(tb_M00_AXI_buser),
        .M00_AXI_bvalid(tb_M00_AXI_bvalid),
        .M00_AXI_rdata(tb_M00_AXI_rdata),
        .M00_AXI_rid(tb_M00_AXI_rid),
        .M00_AXI_rlast(tb_M00_AXI_rlast),
        .M00_AXI_rready(tb_M00_AXI_rready),
        .M00_AXI_rresp(tb_M00_AXI_rresp),
        .M00_AXI_ruser(tb_M00_AXI_ruser),
        .M00_AXI_rvalid(tb_M00_AXI_rvalid),
        .M00_AXI_wdata(tb_M00_AXI_wdata),
        .M00_AXI_wlast(tb_M00_AXI_wlast),
        .M00_AXI_wready(tb_M00_AXI_wready),
        .M00_AXI_wstrb(tb_M00_AXI_wstrb),
        .M00_AXI_wuser(tb_M00_AXI_wuser),
        .M00_AXI_wvalid(tb_M00_AXI_wvalid),
        .m00_axi_aclk(tb_m00_axi_aclk),
        .m00_axi_aresetn(tb_m00_axi_aresetn),
        .m00_axi_error(tb_m00_axi_error),
        .m00_axi_init_axi_txn(tb_m00_axi_init_axi_txn),
        .m00_axi_txn_done(tb_m00_axi_txn_done)
    );
    
    
endmodule
