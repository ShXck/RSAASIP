transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-Arqui {C:/Users/DELL/Desktop/Proyecto2-Arqui/Adder.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-Arqui/EXE {C:/Users/DELL/Desktop/Proyecto2-Arqui/EXE/ALU.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-Arqui/EXE {C:/Users/DELL/Desktop/Proyecto2-Arqui/EXE/Substraction.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-Arqui/EXE {C:/Users/DELL/Desktop/Proyecto2-Arqui/EXE/Mux4.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-Arqui/EXE {C:/Users/DELL/Desktop/Proyecto2-Arqui/EXE/Zero_Flag.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-Arqui/tb {C:/Users/DELL/Desktop/Proyecto2-Arqui/tb/ALU_TB.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-Arqui/EXE {C:/Users/DELL/Desktop/Proyecto2-Arqui/EXE/Mod.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-Arqui/EXE {C:/Users/DELL/Desktop/Proyecto2-Arqui/EXE/Mod_Exp.sv}

