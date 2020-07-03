transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/pipes {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/pipes/IFID_Pipe.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/IF {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/IF/plus_1.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/IF {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/IF/pc_register.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/IF {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/IF/Mux2_PC.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/IF {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/IF/IF.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/Mux2.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/Zero_Extend.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/Adder.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/EXE {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/EXE/ALU.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/EXE {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/EXE/Substraction.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/EXE {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/EXE/Mux4.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/EXE {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/EXE/Zero_Flag.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/EXE {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/EXE/Mod.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/EXE {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/EXE/Mod_Exp.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/EXE {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/EXE/Branch_Unit.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/ID {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/ID/Instr_Decoder.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/ID {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/ID/Register_Bank.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/ID {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/ID/ID.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/EXE {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/EXE/EXE.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/pipes {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/pipes/IDEXE_Pipe.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/pipes {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/pipes/EXEMEM_Pipe.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/ID {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/ID/Control_Unit.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/ProcessorEXE.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/ProcessorEXE_TB.sv}
vlog -sv -work work +incdir+C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/IF {C:/Users/DELL/Desktop/Proyecto2-ASIP/RSAASIP/IF/Instruction_Mem.sv}

