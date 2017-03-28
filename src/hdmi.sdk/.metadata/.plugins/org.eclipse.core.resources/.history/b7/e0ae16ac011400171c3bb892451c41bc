/*
 * vdma.h
 *
 *  Created on: Mar 13, 2016
 *      Author: Farshad
 */

#ifndef VDMA_H_
#define VDMA_H_

/* ------------------------------------------------------------ */
/*				Include File Definitions						*/
/* ------------------------------------------------------------ */

#include "xil_types.h"
#include "xaxivdma.h"
#include "xaxivdma_i.h"

/* ------------------------------------------------------------ */
/*					Procedure Declarations						*/
/* ------------------------------------------------------------ */
void vdma_config(XAxiVdma_DmaSetup *vdmaConfig);
void read_config(XAxiVdma *vdma,
				 XAxiVdma_DmaSetup *vdmaConfig,
				 XAxiVdma_FrameCounter *frame_count_config
				 );
void write_config(XAxiVdma *vdma,
				 XAxiVdma_DmaSetup *vdmaConfig_2,
				 XAxiVdma_FrameCounter *frame_count_config
				 );
int dma_read_from_memory(int ind, XAxiVdma *vdma,
						XAxiVdma_DmaSetup *vdmaConfig,
						XAxiVdma_FrameCounter *frame_count_config,
						u8 *Frame_1);

int dma_write_to_memory(int ind, XAxiVdma *vdma,
						XAxiVdma_DmaSetup *vdmaConfig,
						XAxiVdma_FrameCounter *frame_count_config,
						u8 *Frame_1);

int parking_read(XAxiVdma *vdma);
int parking_write(XAxiVdma *vdma);

int Stop_Dma_write(XAxiVdma *vdma);
int Stop_Dma_read(XAxiVdma *vdma);


/* ------------------------------------------------------------ */

/************************************************************************/

#endif /* VDMA_H_ */
