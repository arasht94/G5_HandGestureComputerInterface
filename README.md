# Group 5 Hand Gesture Computer Interface 

The code for this project is hosted on a Github repository. The figure below shows the directory breakdown for the repository. The arduino/ folder contains the code run on the Arduino that will convert signals from the FPGA to keyboard strokes. The docs/ folder contains this report, the presentation slides as well as a video. The img\_processing\_ip/ contains the LED detection IP blocK. The subfolder ip\_repo/ is the folder that should be included if the IP is going to be used in other projects. The src/ folder contains the main project with the IP integrated into it. Under the hdmi.sdk/ folder, hdmi\_wrapper\_hw\_platform\_6/ is the latest exported hardware and works with standalone\_bsp\_1/ board support package. The subfolder videodemo/ contains all the software code used in this project. The tb/ folder contains the testbench used to test the LED detection blocks. 


The directory tree of the repository:

.  
│── arduino  
│&nbsp;&nbsp;&nbsp;└── keyboard_demo  
│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└── keyboard_demo.ino  
│── docs  
│&nbsp;&nbsp;&nbsp;└── ECE532_Group5_Presentation.pdf  
│&nbsp;&nbsp;&nbsp;└── ECE532_Group5_HGCI_Documentation.pdf  
│&nbsp;&nbsp;&nbsp;└── Group5_HGCI.mp4  
│── img_processing_ip  
│&nbsp;&nbsp;&nbsp;│── ip_repo  
│&nbsp;&nbsp;&nbsp;└── managed_ip_project  
│── README.md  
│── src  
│&nbsp;&nbsp;&nbsp;│── hdmi.sdk  
│&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│── hdmi_wrapper_hw_platform_6  
│&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│── standalone_bsp_1  
│&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│── videodemo  
│&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└── src  
│&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│── vdma  
│&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│── vdma.c  
│&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└── vdma.h  
│&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│── video_demo.c  
│&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└── video_demo.h  
│&nbsp;&nbsp;&nbsp;│── hdmi.xpr  
│&nbsp;&nbsp;&nbsp;│── NexysVideo_Master.xdc  
│&nbsp;&nbsp;&nbsp;│── repo  
└── tb  
