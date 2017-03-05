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
    reg [`IMAGE_DEPTH-1:0] test_vector [0:`IMAGE_HEIGHT-1];
    reg [`IMAGE_DEPTH-1:0] golden_values [0:`IMAGE_HEIGHT-1]; 
    reg [`IMAGE_DEPTH-1:0] output_vector [0:`IMAGE_HEIGHT-1]; 
    reg clock; 
    reg reset;
    reg enable_input; 
    reg input_done;  
    reg [`HEIGHT_COUNTER-1:0] height_counter;
    reg [`HEIGHT_COUNTER-1:0] output_height_counter;
    reg output_aligned;
    reg [3:0] output_bytes_written; 
    integer f,idx,row,column; 
    integer unsigned i; 
    reg [19:0] j; 
    
    /*Setup initialization */ 
    initial begin
        //read data into the test vector
        $readmemh("pic_golden_test.txt", test_vector);
                        
        //read the golden values into vector
        $readmemh("pic_golden_values.txt", golden_values);
                                
        //initialize the input of DUT
        clock = 0; 
        reset = 0; 
        
        //initialize the tb counters and control
        //initialize height to skip bmp header
        height_counter = `BMP_HEADER / `IMAGE_DEPTH;
        enable_input = 0;
        input_done = 0;  
        output_aligned = 0; 
        output_bytes_written = 0;
        output_height_counter = `BMP_HEADER / `IMAGE_DEPTH;
         
        //copy bmp header to output values
        for(i = 0; i < `BMP_HEADER / `IMAGE_DEPTH; i=i+1)
        begin
            output_vector[i] = test_vector[i]; 
        end      
        
        //take DUT out of reset and enable input
        #100
        reset = 1;
        enable_input = 1;
        S00_AXIS_tvalid_tb <= 1;
        
        //set master to ready
        #500    	
        M00_AXIS_tready_tb = 1;
    end
    
    //write the input vector to the DUT
    always@(posedge clock) begin
        if(enable_input && S00_AXIS_tready_tb == 1) begin
            S00_AXIS_tdata_tb[7:0] <= test_vector[height_counter][23:16];
            S00_AXIS_tdata_tb[15:8] <= test_vector[height_counter][15:8];
            S00_AXIS_tdata_tb[23:16] <= test_vector[height_counter][7:0]; 
            S00_AXIS_tstrb_tb <= 4'hf;
            
            if(height_counter < `IMAGE_HEIGHT)
                height_counter <= height_counter + 1;
            else begin
               enable_input <= 0;
               input_done <= 1; 
            end 
        end
    end
        
    //grab output of the DUT and write to file
    always@(posedge clock) begin
        if(M00_AXIS_tvalid_tb == 1 && input_done == 0)begin
            output_vector[output_height_counter] <= M00_AXIS_tdata_tb;
            output_height_counter <= output_height_counter + 1; 
        end
    end
    
    //clock generation 
    always #5  clock = ~clock; 
    
    //check against golden values
    always@(posedge input_done) begin

        //check outputs against golden values, write
        //the output to a log file 
        f = $fopen("results.log","w");
        for(j = 0; j < `IMAGE_HEIGHT; j=j+1) begin
            if(golden_values[j][7:0] != output_vector[j][23:16] ||
               golden_values[j][15:8] != output_vector[j][15:8] ||
               golden_values[j][23:16] != output_vector[j][7:0]) begin 
                $fwrite(f,"Error: Mismatch for row:%d. Expected:%h, Actual: %h\n",j,golden_values[j],output_vector[j]);
            end
        end
                    
        $fclose(f);
    end
    
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
