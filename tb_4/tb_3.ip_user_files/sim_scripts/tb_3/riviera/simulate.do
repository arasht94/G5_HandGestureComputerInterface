onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+tb_3 -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -O5 xil_defaultlib.tb_3 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {tb_3.udo}

run -all

endsim

quit -force
