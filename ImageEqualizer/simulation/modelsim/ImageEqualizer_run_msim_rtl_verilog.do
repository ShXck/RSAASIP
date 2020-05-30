transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU/Testbenches {C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU/Testbenches/tb_ALU.sv}
vlog -sv -work work +incdir+C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU {C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU/xor_A.sv}
vlog -sv -work work +incdir+C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU {C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU/sumador.sv}
vlog -sv -work work +incdir+C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU {C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU/right_shift_logic.sv}
vlog -sv -work work +incdir+C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU {C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU/right_shift_arithmetic.sv}
vlog -sv -work work +incdir+C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU {C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU/or_A.sv}
vlog -sv -work work +incdir+C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU {C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU/not_A.sv}
vlog -sv -work work +incdir+C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU {C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU/mux_Sumador.sv}
vlog -sv -work work +incdir+C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU {C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU/mux_ALU.sv}
vlog -sv -work work +incdir+C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU {C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU/left_shift_logic.sv}
vlog -sv -work work +incdir+C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU {C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU/left_shift_arithmetic.sv}
vlog -sv -work work +incdir+C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU {C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU/flags.sv}
vlog -sv -work work +incdir+C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU {C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU/and_A.sv}
vlog -sv -work work +incdir+C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU {C:/Users/alecastrillo/Desktop/ArquiProyectoI/ARM/ALU/ALU_N_bits.sv}

