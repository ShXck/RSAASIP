transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-Arqui {C:/Users/DELL/Desktop/Proyecto2-Arqui/Mux2.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-Arqui {C:/Users/DELL/Desktop/Proyecto2-Arqui/Zero_Extend.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-Arqui/ID {C:/Users/DELL/Desktop/Proyecto2-Arqui/ID/Instr_Decoder.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-Arqui/ID {C:/Users/DELL/Desktop/Proyecto2-Arqui/ID/Register_Bank.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-Arqui/ID {C:/Users/DELL/Desktop/Proyecto2-Arqui/ID/ID.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-Arqui/tb {C:/Users/DELL/Desktop/Proyecto2-Arqui/tb/ID_TB.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-Arqui/ID {C:/Users/DELL/Desktop/Proyecto2-Arqui/ID/Control_Unit.sv}

