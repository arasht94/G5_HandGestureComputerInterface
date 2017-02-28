#!/bin/bash -f
xv_path="/cad1/Xilinx/Vivado/2016.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim tb_behav -key {Behavioral:sim_1:Functional:tb} -tclbatch tb.tcl -view /nfs/ug/homes-3/d/dezfoul2/ece532/tb_3/tb_behav.wcfg -log simulate.log
