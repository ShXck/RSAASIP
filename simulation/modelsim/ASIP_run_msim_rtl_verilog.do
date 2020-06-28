transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/pipes {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/pipes/IFID_Pipe.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/IF {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/IF/plus_1.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/IF {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/IF/pc_register.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/IF {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/IF/Mux2_PC.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/IF {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/IF/IF.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/Mux2.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/Zero_Extend.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/Adder.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/EXE {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/EXE/ALU.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/EXE {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/EXE/Substraction.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/EXE {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/EXE/Mux4.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/EXE {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/EXE/Zero_Flag.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/EXE {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/EXE/Mod.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/EXE {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/EXE/Mod_Exp.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/EXE {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/EXE/Branch_Unit.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/ID {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/ID/Instr_Decoder.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/ID {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/ID/Register_Bank.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/ID {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/ID/ID.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/EXE {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/EXE/EXE.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/pipes {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/pipes/IDEXE_Pipe.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/ID {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/ID/Control_Unit.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/TOP.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/TOP_tb {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/TOP_tb/Top_EXE_TB.sv}
vlog -sv -work work +incdir+C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/IF {C:/Users/jdmon/OneDrive/Escritorio/RSAASIP-IntegrationTest/IF/Instruction_Mem.sv}

