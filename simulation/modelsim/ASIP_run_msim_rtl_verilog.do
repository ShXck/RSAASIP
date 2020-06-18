transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-Arqui/pipes {C:/Users/DELL/Desktop/Proyecto2-Arqui/pipes/MEMWB_Pipe.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-Arqui/tb {C:/Users/DELL/Desktop/Proyecto2-Arqui/tb/MEMWB_TB.sv}

