
`timescale 1 ns / 1 ps

	module led_detect_v1_0 #
	(
		// Users to add parameters here
        parameter integer FRAME_WIDTH = 1280,
        parameter integer FRAME_HEIGHT = 720,
        parameter integer AXIS_TDATA_WIDTH = 24,
        
        parameter integer FIFO_WIDTH = 1280,
        parameter integer FIFO_BITS = 11,
		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 5,

		// Parameters of Axi Master Bus Interface M00_AXIS
		//parameter integer C_M00_AXIS_TDATA_WIDTH	= 32,
		parameter integer C_M00_AXIS_START_COUNT	= 32

		// Parameters of Axi Slave Bus Interface S00_AXIS
		//parameter integer C_S00_AXIS_TDATA_WIDTH	= 32
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready,

		// Ports of Axi Master Bus Interface M00_AXIS
		input wire  m00_axis_aclk,
		input wire  m00_axis_aresetn,
		output wire  m00_axis_tvalid,
		output wire [AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
		output wire [(AXIS_TDATA_WIDTH/8)-1 : 0] m00_axis_tstrb,
		output wire  m00_axis_tlast,
		input wire  m00_axis_tready,

		// Ports of Axi Slave Bus Interface S00_AXIS
		input wire  s00_axis_aclk,
		input wire  s00_axis_aresetn,
		output wire  s00_axis_tready,
		input wire [AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
		input wire [(AXIS_TDATA_WIDTH/8)-1 : 0] s00_axis_tstrb,
		input wire  s00_axis_tlast,
		input wire  s00_axis_tvalid,
		
		output wire [FIFO_BITS-1:0] write_pointer,
		output wire[15:0] y_coord,
		output wire [31:0] ledr_xy
	);
	
//	wire [31:0] ledr_xy;
//	wire [31:0] ledg_xy;
	
	wire [AXIS_TDATA_WIDTH-1:0] in_data_stream;
//	wire [FIFO_BITS-1:0] write_pointer;
	wire [FIFO_BITS-1:0] read_pointer;
	
	wire [AXIS_TDATA_WIDTH-1:0] out_data_stream;
	
	wire fifo_wren;
	wire stream_from_fifo;
	

// Instantiation of Axi Bus Interface S00_AXI
	led_detect_v1_0_S00_AXI # ( 
	  .AXIS_TDATA_WIDTH(AXIS_TDATA_WIDTH),
	  .FIFO_WIDTH(FIFO_WIDTH),
	  .FIFO_BITS(FIFO_BITS),
	  
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) led_detect_v1_0_S00_AXI_inst (
//		.ledr_xy(ledr_xy),
//		.ledg_xy(ledg_xy),
		.in_data_stream(in_data_stream),
		.out_data_stream(out_data_stream),
		.in_fifo_wren(fifo_wren),
		.write_pointer(write_pointer),
		.read_pointer(read_pointer),
		.stream_from_fifo(stream_from_fifo),
		.y_coord(y_coord),
		.ledr_xy(ledr_xy),
		
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);

// Instantiation of Axi Bus Interface M00_AXIS
	led_detect_v1_0_M00_AXIS # ( 
	  .FRAME_WIDTH(FRAME_WIDTH),
    .FRAME_HEIGHT(FRAME_HEIGHT),
    .FIFO_WIDTH(FIFO_WIDTH),
    .FIFO_BITS(FIFO_BITS),
	
		.AXIS_TDATA_WIDTH(AXIS_TDATA_WIDTH)
		//.C_M_START_COUNT(C_M00_AXIS_START_COUNT)
	) led_detect_v1_0_M00_AXIS_inst (
	  .out_data_stream(out_data_stream),
	  .read_pointer(read_pointer),
	  .stream_from_fifo(stream_from_fifo),
	
		.M_AXIS_ACLK(m00_axis_aclk),
		.M_AXIS_ARESETN(m00_axis_aresetn),
		.M_AXIS_TVALID(m00_axis_tvalid),
		.M_AXIS_TDATA(m00_axis_tdata),
		.M_AXIS_TSTRB(m00_axis_tstrb),
		.M_AXIS_TLAST(m00_axis_tlast),
		.M_AXIS_TREADY(m00_axis_tready)
	);

// Instantiation of Axi Bus Interface S00_AXIS
	led_detect_v1_0_S00_AXIS # ( 
	  .FRAME_WIDTH(FRAME_WIDTH),
	  .FRAME_HEIGHT(FRAME_HEIGHT),
	  .FIFO_WIDTH(FIFO_WIDTH),
	  .FIFO_BITS(FIFO_BITS),
	
		.AXIS_TDATA_WIDTH(AXIS_TDATA_WIDTH)
	) led_detect_v1_0_S00_AXIS_inst (
	  .in_data_stream(in_data_stream),
	  .write_pointer(write_pointer),
	  .fifo_wren(fifo_wren),
	  .stream_from_fifo(stream_from_fifo),
	 
		.S_AXIS_ACLK(s00_axis_aclk),
		.S_AXIS_ARESETN(s00_axis_aresetn),
		.S_AXIS_TREADY(s00_axis_tready),
		.S_AXIS_TDATA(s00_axis_tdata),
		.S_AXIS_TSTRB(s00_axis_tstrb),
		.S_AXIS_TLAST(s00_axis_tlast),
		.S_AXIS_TVALID(s00_axis_tvalid)
	);

	// Add user logic here

	// User logic ends

	endmodule
