/************************************************************************/
/*																		*/
/*	video_demo.c	--	ZYBO Video demonstration 						*/
/*																		*/
/************************************************************************/
/*	Author: Sam Bobrowicz												*/
/*	Copyright 2015, Digilent Inc.										*/
/************************************************************************/
/*  Module Description: 												*/
/*																		*/
/*		This file contains code for running a demonstration of the		*/
/*		Video input and output capabilities on the ZYBO. It is a good	*/
/*		example of how to properly use the display_ctrl and				*/
/*		video_capture drivers.											*/
/*																		*/
/*																		*/
/************************************************************************/
/*  Revision History:													*/
/* 																		*/
/*		11/25/2015(SamB): Created										*/
/*																		*/
/************************************************************************/

/* ------------------------------------------------------------ */
/*				Include File Definitions						*/
/* ------------------------------------------------------------ */

#include "video_demo.h"
#include "video_capture/video_capture.h"
#include "display_ctrl/display_ctrl.h"
#include "intc/intc.h"
//#include <stdio.h>
#include "xuartlite_l.h"
//#include "xuartps.h"
#include "math.h"
#include <ctype.h>
#include <stdlib.h>
#include "xil_types.h"
#include "xil_cache.h"
#include "xparameters.h"
#include "vdma/vdma.h"
#include "led_detect.h"

/*
 * XPAR redefines
 */
#define DYNCLK_BASEADDR XPAR_AXI_DYNCLK_0_BASEADDR
#define VGA_VDMA_ID XPAR_AXIVDMA_0_DEVICE_ID
#define VGA_VDMA2_ID XPAR_AXIVDMA_1_DEVICE_ID
#define DISP_VTC_ID XPAR_VTC_0_DEVICE_ID
#define VID_VTC_ID XPAR_VTC_1_DEVICE_ID
#define GPIO_OUT_ID XPAR_AXI_GPIO_0_DEVICE_ID
#define GPIO_ADDRESS XPAR_AXI_GPIO_0_BASEADDR
#define VID_GPIO_ID XPAR_AXI_GPIO_VIDEO_DEVICE_ID
#define VID_VTC_IRPT_ID XPAR_INTC_0_VTC_1_VEC_ID
#define VID_GPIO_IRPT_ID XPAR_INTC_0_GPIO_1_VEC_ID
#define SCU_TIMER_ID XPAR_AXI_TIMER_0_DEVICE_ID
#define UART_BASEADDR XPAR_UARTLITE_0_BASEADDR
#define LED_DETECT_BASE_ADDR XPAR_LED_DETECT_0_S00_AXI_BASEADDR
/* ------------------------------------------------------------ */
/*				Global Variables								*/
/* ------------------------------------------------------------ */

#define GESTURE_CHECK_DURATION 50
#define SCROLL_X_THRESHOLD 300
#define SCROLL_Y_THRESHOLD 300
int rxbuffer [GESTURE_CHECK_DURATION];
int rybuffer [GESTURE_CHECK_DURATION];
int gxbuffer [GESTURE_CHECK_DURATION];
int gybuffer [GESTURE_CHECK_DURATION];

/*
 * Display and Video Driver structs
 */
DisplayCtrl dispCtrl;
XAxiVdma vdma;
VideoCapture videoCapt;
INTC intc;
char fRefresh; //flag used to trigger a refresh of the Menu on video detect


//Additional vdma variables
XAxiVdma vdma2;
static XAxiVdma_DmaSetup vdma2Config_1; /*VDMA_1 read channel configuration*/
static XAxiVdma_DmaSetup vdma2Config_2; /*VDMA_1 write channel configuration*/
static XAxiVdma_FrameCounter frame_count_config_1;
static XAxiVdma_FrameCounter frame_count_config_2;


/*
 * Framebuffers for video data
 */
u8 frameBuf[DISPLAY_NUM_FRAMES][DEMO_MAX_FRAME];
u8 *pFrames[DISPLAY_NUM_FRAMES]; //array of pointers to the frame buffers

/*
 * Interrupt vector table
 */
const ivt_t ivt[] = {
	videoGpioIvt(VID_GPIO_IRPT_ID, &videoCapt),
	videoVtcIvt(VID_VTC_IRPT_ID, &(videoCapt.vtc))
};


/* ------------------------------------------------------------ */
/*				Functions										*/
/* ------------------------------------------------------------ */

int main(void)
{
	Xil_ICacheEnable();
	Xil_DCacheEnable();
	DemoInitialize();

	DemoRun();

	return 0;
}


void DemoInitialize()
{
	int Status;
	XAxiVdma_Config *vdmaConfig;
	XAxiVdma_Config *vdma2Config;
	int i;

	/*
	 * Initialize an array of pointers to the 3 frame buffers
	 */
	for (i = 0; i < DISPLAY_NUM_FRAMES; i++)
	{
		pFrames[i] = frameBuf[i];
	}

	/*
	 * Initialize VDMA driver
	 */
	vdmaConfig = XAxiVdma_LookupConfig(VGA_VDMA_ID);
	if (!vdmaConfig)
	{
		xil_printf("No video DMA found for ID %d\r\n", VGA_VDMA_ID);
		return;
	}
	Status = XAxiVdma_CfgInitialize(&vdma, vdmaConfig, vdmaConfig->BaseAddress);
	if (Status != XST_SUCCESS)
	{
		xil_printf("VDMA Configuration Initialization failed %d\r\n", Status);
		return;
	}

	/*
	 * Initialize VDMA2 driver
	 */
	vdma2Config = XAxiVdma_LookupConfig(VGA_VDMA2_ID);
	if (!vdma2Config)
	{
		xil_printf("No video DMA found for ID %d\r\n", VGA_VDMA2_ID);
		return;
	}
	Status = XAxiVdma_CfgInitialize(&vdma2, vdma2Config, vdma2Config->BaseAddress);
	if (Status != XST_SUCCESS)
	{
		xil_printf("VDMA2 Configuration Initialization failed %d\r\n", Status);
		return;
	}
	//configure objects for the vdma2
	read_config(&vdma2, &vdma2Config_1, &frame_count_config_1);
	write_config(&vdma2, &vdma2Config_2, &frame_count_config_2);


	/*
	 * Initialize the Display controller and start it
	 */
	Status = DisplayInitialize(&dispCtrl, &vdma, DISP_VTC_ID, DYNCLK_BASEADDR, pFrames, DEMO_STRIDE);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Display Ctrl initialization failed during demo initialization%d\r\n", Status);
		return;
	}
	Status = DisplayStart(&dispCtrl);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Couldn't start display during demo initialization%d\r\n", Status);
		return;
	}

	/*
	 * Initialize the Interrupt controller and start it.
	 */
	Status = fnInitInterruptController(&intc);
	if(Status != XST_SUCCESS) {
		xil_printf("Error initializing interrupts");
		return;
	}
	fnEnableInterrupts(&intc, &ivt[0], sizeof(ivt)/sizeof(ivt[0]));

	/*
	 * Initialize the Video Capture device
	 */
	Status = VideoInitialize(&videoCapt, &intc, &vdma, VID_GPIO_ID, VID_VTC_ID, VID_VTC_IRPT_ID, pFrames, DEMO_STRIDE, DEMO_START_ON_DET);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Video Ctrl initialization failed during demo initialization%d\r\n", Status);
		return;
	}

	/*
	 * Set the Video Detect callback to trigger the menu to reset, displaying the new detected resolution
	 */
	VideoSetCallback(&videoCapt, DemoISR, &fRefresh);

	/*
	 * Program thresholds and Enable IP
	 */
	LED_DETECT_mWriteReg(LED_DETECT_BASE_ADDR, LED_DETECT_S00_AXI_SLV_REG3_OFFSET, 220);
	LED_DETECT_mWriteReg(LED_DETECT_BASE_ADDR, LED_DETECT_S00_AXI_SLV_REG4_OFFSET, 220);
	LED_DETECT_mWriteReg(LED_DETECT_BASE_ADDR, LED_DETECT_S00_AXI_SLV_REG5_OFFSET, 100);

	//initialize the gesture detection buffers
	reset_buffers(rxbuffer,rybuffer);
	reset_buffers(gxbuffer,gybuffer);

	/*
	 * Initialize GPIO out to Arduino
	 */
	//Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, 0x3f);
	/*XGpio gpio_out = {0,0,0,0};
	XGpio_Initialize(&gpio_out,GPIO_OUT_ID);
	XGpio_Config * gpio_config = XGpio_LookupConfig(GPIO_OUT_ID);
	XGpio_CfgInitialize(&gpio_out, gpio_config,GPIO_ADDRESS);
	XGpio_SetDataDirection(&gpio_out,0,0x3f);
	XGpio_DiscreteWrite(&gpio_out,0, 0x3f);*/


	//Test the output of the monitor
	//DemoPrintTest(dispCtrl.framePtr[dispCtrl.curFrame], dispCtrl.vMode.width, dispCtrl.vMode.height, dispCtrl.stride, DEMO_PATTERN_1);

	return;
}

void DemoRun()
{
	int status;
	XGpio *GpioPtr = &videoCapt.gpio;
	int i,j;

	xil_printf("Test1\n");

	/* Flush UART FIFO */
	while (!XUartLite_IsReceiveEmpty(UART_BASEADDR))
	{
		XUartLite_ReadReg(UART_BASEADDR, XUL_RX_FIFO_OFFSET);
	}

	/* ECE532 */
	xil_printf("Test2\n");
	fRefresh = 0;

	videoCapt.state=VIDEO_STREAMING;
	VideoStart(&videoCapt);


	/*pipe input to output */
	DisplayChangeFrame(&dispCtrl, 1);
	status = DisplayStop(&dispCtrl);
	DisplaySetMode(&dispCtrl, &VMODE_1280x720);
	DisplayStart(&dispCtrl);

	/* check whether it worked */
	if (status == XST_DMA_ERROR)
		xil_printf("\n\rWARNING: AXI VDM A Error detected and cleared\n\r");

	//loop and grab from vdmas
	while(1){
		//spin if not ready, plug HDMI-IN out and back in
		while (XUartLite_IsReceiveEmpty(UART_BASEADDR) && !fRefresh);
		XGpio_DiscreteRead(GpioPtr, 2);

		//enable the IP
		LED_DETECT_mWriteReg(LED_DETECT_BASE_ADDR, LED_DETECT_S00_AXI_SLV_REG0_OFFSET, 2);

		//control vdmas
		for (i = 0; i < 720; i++){ //720 = number of rows
			//read row into IP
			dma_read_from_memory(i,&vdma2,&vdma2Config_1,&frame_count_config_1,pFrames[0]);

			//sleep a little
			for(j=0; j<250; j++);

			//write row from IP to DDR
			while(dma_write_to_memory(i,&vdma2,&vdma2Config_2,&frame_count_config_2,pFrames[1]) == XST_FAILURE);
		}

		//read the xy values from IP for both colours and separate the x and y values
		int rxy, gxy, rx, ry, gx, gy;
		rxy = LED_DETECT_mReadReg(LED_DETECT_BASE_ADDR, LED_DETECT_S00_AXI_SLV_REG1_OFFSET);
		gxy = LED_DETECT_mReadReg(LED_DETECT_BASE_ADDR, LED_DETECT_S00_AXI_SLV_REG2_OFFSET);
		split_coordinates(rxy,&rx,&ry);
		split_coordinates(gxy,&gx,&gy);
		xil_printf("RED:(%d,%d) GREEN:(%d,%d) rxy:%x gxy:%x\n",rx,ry,gx,gy,rxy,gxy);

		//disable IP to reset to ycoord
		LED_DETECT_mWriteReg(LED_DETECT_BASE_ADDR, LED_DETECT_S00_AXI_SLV_REG0_OFFSET, 0);

		//perform gesture detection
		//Gesture detected_gesture = gesture_detect(rx,ry,rxbuffer,rybuffer,gx,gy,gxbuffer,gybuffer);

		//if(detected_gesture != NONE){
		//	xil_printf("Gesture:%d\n",detected_gesture);
		//}
	}


	return;
}


/**
 * Extract the x and y sections of the coordinates
 */
void split_coordinates(int xy, int* x, int* y ){
	*x = (xy & 0xffff0000) >> 16;
	*y = xy & 0x0000ffff;
}

/**
 * Initialize the buffers to zero
 */
void reset_buffers (int xbuffer[],int ybuffer[]){
	int i;
	for (i=0; i<GESTURE_CHECK_DURATION; i++)
	{
		xbuffer[i]= 0;
		ybuffer[i]= 0;
	}
}

/**
 * Shift the buffers over and insert the new
 * coordinate into the LSB position
 */
void update_buffers(int x, int y, int xbuffer[], int ybuffer[]){
	//shift the buffers
	int i;
	for (i=GESTURE_CHECK_DURATION-1; i>0; i--){
			xbuffer[i]= xbuffer[i-1];
			ybuffer[i]= ybuffer[i-1];
	}

	//insert coordinate into LSB positions
	xbuffer[i]=x;
	ybuffer[i]=y;
}

/**
 * Detect the scrolling int the x and y directions
 * and output the gesture detected
 */
Gesture scroll_detect(int xbuffer[],int ybuffer[]){
	int i;
	int total_dx = 0;
	int total_dy = 0;

	//loop through buffer and calculate the total
	//deltas
	for (i=1; i<GESTURE_CHECK_DURATION; i++){
		total_dx += xbuffer[i] - xbuffer[i-1];
		total_dy += ybuffer[i] - ybuffer[i-1];

		if(i>=2){// b/c using i-2
			if(total_dx > SCROLL_X_THRESHOLD && xbuffer[i] < xbuffer[i-2] ){ // && total_dy < SCROLL_Y_THRESHOLD
				reset_buffers(xbuffer,ybuffer);
				return SCROLL_LEFT;
			}
			else if(total_dx > SCROLL_X_THRESHOLD && xbuffer[i] > xbuffer[i-2]){ // && total_dy < SCROLL_Y_THRESHOLD
				reset_buffers(xbuffer,ybuffer);
				return SCROLL_RIGHT;
			}
		}
	}

	//did not find a gesture
	return NONE;
}

/**
 * Function that calls all other gesture detect function
 * This function prioritizes certain gestures over others.
 * Scrolling is prioritized over zooming.
 */
Gesture gesture_detect(int rx,int ry,int rxbuffer[],int rybuffer[],int gx, int gy,int gxbuffer[],int gybuffer[]){
	//place x and y values into the buffers
	update_buffers(rx,ry,rxbuffer,rybuffer);
	update_buffers(gx,gy,gxbuffer,gybuffer);

	//scroll detection
	Gesture r_scroll = scroll_detect(rxbuffer,rybuffer);
	Gesture g_scroll = scroll_detect(gxbuffer,gybuffer);
	if(r_scroll == g_scroll){
		return r_scroll;
	}

	//zoom detect

}
/* Armin's old function
Gesture scroll_detect(){
	int i;
	int dx [GESTURE_CHECK_DURATION-1];
	int dy [GESTURE_CHECK_DURATION-1];
	int total_dx = 0;
	int total_dy = 0;
	for (i=0; i<GESTURE_CHECK_DURATION; i++)
	{
		dx[i] = xbuffer[i] - xbuffer[i-1];
		dy[i] = ybuffer[i] - ybuffer[i-1];
		total_dx += dx[i];
		total_dy += dy[i];
		if(total_dx < SCROLL_X_THRESHOLD && total_dy > SCROLL_Y_THRESHOLD)
		{
			reset_buffers();
			return 1;
		}
	}
	return 0;
}*/


void DemoPrintTest(u8 *frame, u32 width, u32 height, u32 stride, int pattern)
{
	u32 xcoi, ycoi;
	u32 iPixelAddr;
	u8 wRed, wBlue, wGreen;
	u32 wCurrentInt;
	double fRed, fBlue, fGreen, fColor;
	u32 xLeft, xMid, xRight, xInt;
	u32 yMid, yInt;
	double xInc, yInc;


	switch (pattern)
	{
	case DEMO_PATTERN_0:

		xInt = width / 4; //Four intervals, each with width/4 pixels
		xLeft = xInt * 3;
		xMid = xInt * 2 * 3;
		xRight = xInt * 3 * 3;
		xInc = 256.0 / ((double) xInt); //256 color intensities are cycled through per interval (overflow must be caught when color=256.0)

		yInt = height / 2; //Two intervals, each with width/2 lines
		yMid = yInt;
		yInc = 256.0 / ((double) yInt); //256 color intensities are cycled through per interval (overflow must be caught when color=256.0)

		fBlue = 0.0;
		fRed = 256.0;
		for(xcoi = 0; xcoi < (width*3); xcoi+=3)
		{
			/*
			 * Convert color intensities to integers < 256, and trim values >=256
			 */
			wRed = (fRed >= 256.0) ? 255 : ((u8) fRed);
			wBlue = (fBlue >= 256.0) ? 255 : ((u8) fBlue);
			iPixelAddr = xcoi;
			fGreen = 0.0;
			for(ycoi = 0; ycoi < height; ycoi++)
			{

				wGreen = (fGreen >= 256.0) ? 255 : ((u8) fGreen);
				frame[iPixelAddr] = wRed;
				frame[iPixelAddr + 1] = wBlue;
				frame[iPixelAddr + 2] = wGreen;
				if (ycoi < yMid)
				{
					fGreen += yInc;
				}
				else
				{
					fGreen -= yInc;
				}

				/*
				 * This pattern is printed one vertical line at a time, so the address must be incremented
				 * by the stride instead of just 1.
				 */
				iPixelAddr += stride;
			}

			if (xcoi < xLeft)
			{
				fBlue = 0.0;
				fRed -= xInc;
			}
			else if (xcoi < xMid)
			{
				fBlue += xInc;
				fRed += xInc;
			}
			else if (xcoi < xRight)
			{
				fBlue -= xInc;
				fRed -= xInc;
			}
			else
			{
				fBlue += xInc;
				fRed = 0;
			}
		}
		/*
		 * Flush the framebuffer memory range to ensure changes are written to the
		 * actual memory, and therefore accessible by the VDMA.
		 */
		Xil_DCacheFlushRange((unsigned int) frame, DEMO_MAX_FRAME);
		break;
	case DEMO_PATTERN_1:

		xInt = width / 7; //Seven intervals, each with width/7 pixels
		xInc = 256.0 / ((double) xInt); //256 color intensities per interval. Notice that overflow is handled for this pattern.

		fColor = 0.0;
		wCurrentInt = 1;
		for(xcoi = 0; xcoi < (width*3); xcoi+=3)
		{

			/*
			 * Just draw white in the last partial interval (when width is not divisible by 7)
			 */
			if (wCurrentInt > 7)
			{
				wRed = 255;
				wBlue = 255;
				wGreen = 255;
			}
			else
			{
				if (wCurrentInt & 0b001)
					wRed = (u8) fColor;
				else
					wRed = 0;

				if (wCurrentInt & 0b010)
					wBlue = (u8) fColor;
				else
					wBlue = 0;

				if (wCurrentInt & 0b100)
					wGreen = (u8) fColor;
				else
					wGreen = 0;
			}

			iPixelAddr = xcoi;

			for(ycoi = 0; ycoi < height; ycoi++)
			{
				frame[iPixelAddr] = wRed;
				frame[iPixelAddr + 1] = wBlue;
				frame[iPixelAddr + 2] = wGreen;
				/*
				 * This pattern is printed one vertical line at a time, so the address must be incremented
				 * by the stride instead of just 1.
				 */
				iPixelAddr += stride;
			}

			fColor += xInc;
			if (fColor >= 256.0)
			{
				fColor = 0.0;
				wCurrentInt++;
			}
		}
		/*
		 * Flush the framebuffer memory range to ensure changes are written to the
		 * actual memory, and therefore accessible by the VDMA.
		 */
		Xil_DCacheFlushRange((unsigned int) frame, DEMO_MAX_FRAME);
		break;
	default :
		xil_printf("Error: invalid pattern passed to DemoPrintTest");
	}
}

void DemoISR(void *callBackRef, void *pVideo)
{
	char *data = (char *) callBackRef;
	*data = 1; //set fRefresh to 1
}


void start_frame_read(){
	int blah=0;
	int Status;
	int i;

	XAxiVdma_DmaSetup vdmaConfig;
	XAxiVdma_FrameCounter framecounter;


	vdmaConfig.FrameDelay = 0;
	vdmaConfig.EnableCircularBuf = 1;// Charles wrote 0
	vdmaConfig.EnableSync = 0;
	vdmaConfig.PointNum = 0;
	vdmaConfig.EnableFrameCounter = 1;
	vdmaConfig.VertSizeInput = dispCtrl.vdmaConfig.VertSizeInput;

	vdmaConfig.HoriSizeInput = dispCtrl.vdmaConfig.HoriSizeInput;

	//xil_printf("\n\rver %d\n\r", vdmaConfig.VertSizeInput);
	//xil_printf("\n\rhor %d\n\r", vdmaConfig.HoriSizeInput);

	//xil_printf("\n\r the horSizeInput is: %d\n\r", dispCtrl.vdmaConfig.HoriSizeInput);
	//xil_printf("\n\r the vertSizeInput is: %d\n\r", dispCtrl.vdmaConfig.VertSizeInput);
	vdmaConfig.FixedFrameStoreAddr = dispCtrl.curFrame;

	framecounter.ReadFrameCount = 1;
	framecounter.ReadDelayTimerCount = 0;
	framecounter.WriteFrameCount = 0;
	framecounter.WriteDelayTimerCount = 0;

	vdmaConfig.Stride = DEMO_STRIDE; // TODO: Double check

	for (i = 0; i < DISPLAY_NUM_FRAMES; i++)
	{
		vdmaConfig.FrameStoreStartAddr[i] = (u32) dispCtrl.framePtr[i];
	}

			//vdmaConfig.FrameStoreStartAddr[0] = (u32)  pFrames[0];


			Status = XAxiVdma_DmaConfig(&vdma2, XAXIVDMA_READ, &(vdmaConfig));


			Status = XAxiVdma_DmaSetBufferAddr(&vdma2, XAXIVDMA_READ, vdmaConfig.FrameStoreStartAddr);

			XAxiVdma_SetFrameCounter(&vdma2, &framecounter);// Blah Hi! hold on!



			Status = XAxiVdma_DmaStart(&vdma2, XAXIVDMA_READ);
			if (blah==0){
				Status = XAxiVdma_StartParking(&vdma2, dispCtrl.curFrame, XAXIVDMA_READ);
				blah = 1;
			}



	return;

}
