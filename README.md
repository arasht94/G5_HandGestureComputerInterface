# Group 5 Hand Gesture Computer Interface 

The code for this project is hosted on a Github repository. The figure below shows the directory breakdown for the repository. The arduino/ folder contains the code run on the Arduino that will convert signals from the FPGA to keyboard strokes. The docs/ folder contains this report, the presentation slides as well as a video. The img\_processing\_ip/ contains the LED detection IP blocK. The subfolder ip\_repo/ is the folder that should be included if the IP is going to be used in other projects. The src/ folder contains the main project with the IP integrated into it. Under the hdmi.sdk/ folder, hdmi\_wrapper\_hw\_platform\_6/ is the latest exported hardware and works with standalone\_bsp\_1/ board support package. The subfolder videodemo/ contains all the software code used in this project. The tb/ folder contains the testbench used to test the LED detection blocks. 


The directory tree of the repository:

.
├── arduino  
│   └── keyboard_demo  
│       └── keyboard_demo.ino  
├── docs  
│   └── ECE532_Group5_Presentation.pdf  
├── img_processing_ip  
│   ├── ip_repo  
│   └── managed_ip_project  
├── README.md  
├── src  
│   ├── hdmi.sdk  
│   │   ├── hdmi_wrapper_hw_platform_6  
│   │   ├── standalone_bsp_1  
│   │   ├── videodemo  
│   │   │   └── src  
│   │   │       ├── display_ctrl  
│   │   │       │   ├── display_ctrl.c  
│   │   │       │   ├── display_ctrl.h  
│   │   │       │   └── vga_modes.h  
│   │   │       ├── dynclk  
│   │   │       │   ├── dynclk.c  
│   │   │       │   └── dynclk.h  
│   │   │       ├── intc  
│   │   │       │   ├── intc.c  
│   │   │       │   └── intc.h  
│   │   │       ├── lscript.ld  
│   │   │       ├── README.txt  
│   │   │       ├── timer_ps  
│   │   │       │   ├── timer_ps.c  
│   │   │       │   └── timer_ps.h  
│   │   │       ├── vdma  
│   │   │       │   ├── vdma.c  
│   │   │       │   └── vdma.h  
│   │   │       ├── video_capture  
│   │   │       │   ├── video_capture.c  
│   │   │       │   └── video_capture.h  
│   │   │       ├── video_demo.c  
│   │   │       └── video_demo.h  
│   ├── hdmi.xpr  
│   ├── NexysVideo_Master.xdc  
│   ├── repo  
└── tb_4  
