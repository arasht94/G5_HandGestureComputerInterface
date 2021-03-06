# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a200tsbg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir W:/ece532/src/hdmi.cache/wt [current_project]
set_property parent.project_path W:/ece532/src/hdmi.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:nexys_video:part0:1.1 [current_project]
set_property ip_repo_paths {
  w:/ece532/img_processing_ip/ip_repo
  w:/ece532/src/repo
} [current_project]
add_files W:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/hdmi.bd
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_axi_gpio_video_0/hdmi_axi_gpio_video_0_board.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_axi_gpio_video_0/hdmi_axi_gpio_video_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_axi_gpio_video_0/hdmi_axi_gpio_video_0.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_axi_timer_0_0/hdmi_axi_timer_0_0.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_axi_timer_0_0/hdmi_axi_timer_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_axi_uartlite_0_0/hdmi_axi_uartlite_0_0_board.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_axi_uartlite_0_0/hdmi_axi_uartlite_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_axi_uartlite_0_0/hdmi_axi_uartlite_0_0.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_axi_vdma_0_0/hdmi_axi_vdma_0_0.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_axi_vdma_0_0/hdmi_axi_vdma_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_axi_vdma_0_0/hdmi_axi_vdma_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_dvi2rgb_0_0/src/dvi2rgb.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_dvi2rgb_0_0/src/dvi2rgb_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_mdm_1_0/hdmi_mdm_1_0.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_mdm_1_0/hdmi_mdm_1_0_ooc_trace.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_microblaze_0_0/hdmi_microblaze_0_0.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_microblaze_0_0/hdmi_microblaze_0_0_ooc_debug.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_microblaze_0_0/hdmi_microblaze_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_microblaze_0_axi_intc_0/hdmi_microblaze_0_axi_intc_0.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_microblaze_0_axi_intc_0/hdmi_microblaze_0_axi_intc_0_clocks.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_microblaze_0_axi_intc_0/hdmi_microblaze_0_axi_intc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_dlmb_bram_if_cntlr_0/hdmi_dlmb_bram_if_cntlr_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_dlmb_v10_0/hdmi_dlmb_v10_0.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_dlmb_v10_0/hdmi_dlmb_v10_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_ilmb_bram_if_cntlr_0/hdmi_ilmb_bram_if_cntlr_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_ilmb_v10_0/hdmi_ilmb_v10_0.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_ilmb_v10_0/hdmi_ilmb_v10_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_lmb_bram_0/hdmi_lmb_bram_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_mig_7series_0_0/hdmi_mig_7series_0_0/user_design/constraints/hdmi_mig_7series_0_0.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_mig_7series_0_0/hdmi_mig_7series_0_0/user_design/constraints/hdmi_mig_7series_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_mig_7series_0_0/hdmi_mig_7series_0_0_board.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_rgb2dvi_0_0/src/rgb2dvi.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_rgb2dvi_0_0/src/rgb2dvi_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_rgb2dvi_0_0/src/rgb2dvi_clocks.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_rst_mig_7series_0_100M_0/hdmi_rst_mig_7series_0_100M_0_board.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_rst_mig_7series_0_100M_0/hdmi_rst_mig_7series_0_100M_0.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_rst_mig_7series_0_100M_0/hdmi_rst_mig_7series_0_100M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_rst_mig_7series_0_pxl_0/hdmi_rst_mig_7series_0_pxl_0_board.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_rst_mig_7series_0_pxl_0/hdmi_rst_mig_7series_0_pxl_0.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_rst_mig_7series_0_pxl_0/hdmi_rst_mig_7series_0_pxl_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_v_axi4s_vid_out_0_0/hdmi_v_axi4s_vid_out_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_v_axi4s_vid_out_0_0/hdmi_v_axi4s_vid_out_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_v_tc_0_0/hdmi_v_tc_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_v_tc_0_0/hdmi_v_tc_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_v_tc_1_0/hdmi_v_tc_1_0_clocks.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_v_tc_1_0/hdmi_v_tc_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_v_vid_in_axi4s_0_0/hdmi_v_vid_in_axi4s_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_v_vid_in_axi4s_0_0/hdmi_v_vid_in_axi4s_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_xbar_0/hdmi_xbar_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_xbar_1/hdmi_xbar_1_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_axi_vdma_0_1/hdmi_axi_vdma_0_1.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_axi_vdma_0_1/hdmi_axi_vdma_0_1_clocks.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_axi_vdma_0_1/hdmi_axi_vdma_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_ila_0_0/ila_v6_1/constraints/ila.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_ila_0_0/hdmi_ila_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_ila_0_1/ila_v6_1/constraints/ila.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_ila_0_1/hdmi_ila_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_ila_1_0/ila_v6_1/constraints/ila.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_ila_1_0/hdmi_ila_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_axi_gpio_0_3/hdmi_axi_gpio_0_3_board.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_axi_gpio_0_3/hdmi_axi_gpio_0_3_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_axi_gpio_0_3/hdmi_axi_gpio_0_3.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_s00_regslice_0/hdmi_s00_regslice_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_s01_regslice_0/hdmi_s01_regslice_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_s02_regslice_0/hdmi_s02_regslice_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_s03_regslice_0/hdmi_s03_regslice_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_s04_regslice_0/hdmi_s04_regslice_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_s05_regslice_0/hdmi_s05_regslice_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_m00_data_fifo_0/hdmi_m00_data_fifo_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_m00_regslice_0/hdmi_m00_regslice_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_auto_ds_0/hdmi_auto_ds_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_auto_ds_0/hdmi_auto_ds_0_clocks.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_0/hdmi_auto_us_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_0/hdmi_auto_us_0_clocks.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_auto_rs_w_0/hdmi_auto_rs_w_0_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_1/hdmi_auto_us_1_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_1/hdmi_auto_us_1_clocks.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_auto_rs_w_1/hdmi_auto_rs_w_1_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_2/hdmi_auto_us_2_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_2/hdmi_auto_us_2_clocks.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_auto_rs_w_2/hdmi_auto_rs_w_2_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_3/hdmi_auto_us_3_ooc.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_3/hdmi_auto_us_3_clocks.xdc]
set_property used_in_implementation false [get_files -all w:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/ip/hdmi_auto_rs_w_3/hdmi_auto_rs_w_3_ooc.xdc]
set_property used_in_implementation false [get_files -all W:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/hdmi_ooc.xdc]
set_property is_locked true [get_files W:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/hdmi.bd]

read_vhdl -library xil_defaultlib W:/ece532/src/hdmi.srcs/sources_1/bd/hdmi/hdl/hdmi_wrapper.vhd
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc W:/ece532/src/NexysVideo_Master.xdc
set_property used_in_implementation false [get_files W:/ece532/src/NexysVideo_Master.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top hdmi_wrapper -part xc7a200tsbg484-1 -fanout_limit 400 -fsm_extraction one_hot -keep_equivalent_registers -resource_sharing off -no_lc -shreg_min_size 5


write_checkpoint -force -noxdef hdmi_wrapper.dcp

catch { report_utilization -file hdmi_wrapper_utilization_synth.rpt -pb hdmi_wrapper_utilization_synth.pb }
