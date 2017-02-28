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

//include constants
`include "constants.vh" 

module tb();
   
    /* Wires for DUT */
    wire [23:0]M00_AXIS_tdata_tb;
    wire M00_AXIS_tlast_tb;
    reg M00_AXIS_tready_tb;
    wire [2:0]M00_AXIS_tstrb_tb;
    wire M00_AXIS_tvalid_tb;
    reg [23:0]S00_AXIS_tdata_tb;
    wire S00_AXIS_tlast_tb;
    wire S00_AXIS_tready_tb;
    reg [2:0]S00_AXIS_tstrb_tb;
    reg S00_AXIS_tvalid_tb;
    wire [4:0]S00_AXI_araddr_tb;
    wire [2:0]S00_AXI_arprot_tb;
    wire S00_AXI_arready_tb;
    wire S00_AXI_arvalid_tb;
    wire [4:0]S00_AXI_awaddr_tb;
    wire [2:0]S00_AXI_awprot_tb;
    wire S00_AXI_awready_tb;
    wire S00_AXI_awvalid_tb;
    wire S00_AXI_bready_tb;
    wire [1:0]S00_AXI_bresp_tb;
    wire S00_AXI_bvalid_tb;
    wire [31:0]S00_AXI_rdata_tb;
    wire S00_AXI_rready_tb;
    wire [1:0]S00_AXI_rresp_tb;
    wire S00_AXI_rvalid_tb;
    wire [31:0]S00_AXI_wdata_tb;
    wire S00_AXI_wready_tb;
    wire [3:0]S00_AXI_wstrb_tb;
    wire S00_AXI_wvalid_tb;
    wire m00_axis_aclk_tb;
    wire m00_axis_aresetn_tb;
    
    /* Regs for testbench use */
    reg [23:0] test_vector [0:0]; 
    reg [`IMAGE_DEPTH-1:0] output_vector; 
    reg clock; 
    reg reset; 
 
    /*Setup initialization */ 
    initial begin
    	//read a data into the test vector
    	$readmemh("test1.txt", test_vector);
    	
    	//initialize the input of DUT
    	clock = 0; 
    	reset = 0; 
    	
    	#100
    	reset = 1;

        //set master to ready
        #500    	
        M00_AXIS_tready_tb = 1;
    end
    
    //write the vector to the DUT
    always@(posedge clock) begin
        S00_AXIS_tvalid_tb <= 1; 
        S00_AXIS_tdata_tb <= test_vector[0][23:0]; 
        S00_AXIS_tstrb_tb <= 4'hf;
    end
    
    //grab output of the DUT
    always@(M00_AXIS_tvalid_tb) begin
        output_vector <= M00_AXIS_tdata_tb;  
    end
    
    //clock generation 
    always #5  clock = ~clock; 
    
    
    
    /* Instantiate DUT */
    tb_3 ip_dut (
        .M00_AXIS_tdata(M00_AXIS_tdata_tb),
        .M00_AXIS_tlast(M00_AXIS_tlast_tb),
        .M00_AXIS_tready(M00_AXIS_tready_tb),
        .M00_AXIS_tstrb(M00_AXIS_tstrb_tb),
        .M00_AXIS_tvalid(M00_AXIS_tvalid_tb),
        .S00_AXIS_tdata(S00_AXIS_tdata_tb),
        .S00_AXIS_tlast(S00_AXIS_tlast_tb),
        .S00_AXIS_tready(S00_AXIS_tready_tb),
        .S00_AXIS_tstrb(S00_AXIS_tstrb_tb),
        .S00_AXIS_tvalid(S00_AXIS_tvalid_tb),
        .S00_AXI_araddr(S00_AXI_araddr_tb),
        .S00_AXI_arprot(S00_AXI_arprot_tb),
        .S00_AXI_arready(S00_AXI_arready_tb),
        .S00_AXI_arvalid(S00_AXI_arvalid_tb),
        .S00_AXI_awaddr(S00_AXI_awaddr_tb),
        .S00_AXI_awprot(S00_AXI_awprot_tb),
        .S00_AXI_awready(S00_AXI_awready_tb),
        .S00_AXI_awvalid(S00_AXI_awvalid_tb),
        .S00_AXI_bready(S00_AXI_bready_tb),
        .S00_AXI_bresp(S00_AXI_bresp_tb),
        .S00_AXI_bvalid(S00_AXI_bvalid_tb),
        .S00_AXI_rdata(S00_AXI_rdata_tb),
        .S00_AXI_rready(S00_AXI_rready_tb),
        .S00_AXI_rresp(S00_AXI_rresp_tb),
        .S00_AXI_rvalid(S00_AXI_rvalid_tb),
        .S00_AXI_wdata(S00_AXI_wdata_tb),
        .S00_AXI_wready(S00_AXI_wready_tb),
        .S00_AXI_wstrb(S00_AXI_wstrb_tb),
        .S00_AXI_wvalid(S00_AXI_wvalid_tb),
        .m00_axis_aclk(clock),
        .m00_axis_aresetn(reset)
    );
endmodule
