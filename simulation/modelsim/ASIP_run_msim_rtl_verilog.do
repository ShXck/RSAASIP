transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/EXE {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/EXE/Mod.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/EXE {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/EXE/Mod_Exp.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/MODEX_Processor.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/MODEX_Processor_TB.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/Zero_Ext_32.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/MODEX_Memory.sv}

