/************************************************************************/
/*																		*/
/*	video_demo.h	--	ZYBO Video demonstration 						*/
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

#ifndef VIDEO_DEMO_H_
#define VIDEO_DEMO_H_

/* ------------------------------------------------------------ */
/*				Include File Definitions						*/
/* ------------------------------------------------------------ */

#include "xil_types.h"

/* ------------------------------------------------------------ */
/*					Miscellaneous Declarations					*/
/* ------------------------------------------------------------ */

#define DEMO_PATTERN_0 0
#define DEMO_PATTERN_1 1

#define DEMO_MAX_FRAME (1280*720*3)
#define DEMO_STRIDE (1280 * 3)

/*
 * Configure the Video capture driver to start streaming on signal
 * detection
 */
#define DEMO_START_ON_DET 1

/**
 * Enum definition for gestures
 */
typedef enum {
	NONE,
	SCROLL_DOWN,
	SCROLL_UP,
	SCROLL_LEFT,
	SCROLL_RIGHT,
	ZOOM_IN,
	ZOOM_OUT
} Gesture;

/* ------------------------------------------------------------ */
/*					Procedure Declarations						*/
/* ------------------------------------------------------------ */

void DemoInitialize();
void DemoRun();
void DemoPrintTest(u8 *frame, u32 width, u32 height, u32 stride, int pattern);
void DemoISR(void *callBackRef, void *pVideo);
void split_coordinates(int xy, int* x, int* y );
void reset_buffers ();
void update_buffers (int x, int y,int xbuffer[],int ybuffer[]);
Gesture scroll_detect(int xbuffer[],int ybuffer[]);
Gesture gesture_detect(int rx,int ry,int rxbuffer[],int rybuffer[],int gx, int gy,int gxbuffer[],int gybuffer[], double zoombuffer[]);
const char* get_gesture_string(Gesture gesture);
void update_zoom_buffers(int rx, int ry, int gx, int gy, double zoombuffer[]);
Gesture zoom_detect(double zoombuffer[]);
double sqroot(double square);
void handshake_send(Gesture gesture);
/* ------------------------------------------------------------ */

/************************************************************************/

#endif /* VIDEO_DEMO_H_ */
