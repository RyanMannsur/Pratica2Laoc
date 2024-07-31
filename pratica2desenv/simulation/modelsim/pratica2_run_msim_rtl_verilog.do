transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Verilog/pratica2desenv {C:/Verilog/pratica2desenv/mux.v}
vlog -vlog01compat -work work +incdir+C:/Verilog/pratica2desenv {C:/Verilog/pratica2desenv/addSub.v}
vlog -vlog01compat -work work +incdir+C:/Verilog/pratica2desenv {C:/Verilog/pratica2desenv/upcount.v}
vlog -vlog01compat -work work +incdir+C:/Verilog/pratica2desenv {C:/Verilog/pratica2desenv/controle.v}
vlog -vlog01compat -work work +incdir+C:/Verilog/pratica2desenv {C:/Verilog/pratica2desenv/registrador.v}
vlog -vlog01compat -work work +incdir+C:/Verilog/pratica2desenv {C:/Verilog/pratica2desenv/memoria.v}
vlog -vlog01compat -work work +incdir+C:/Verilog/pratica2desenv {C:/Verilog/pratica2desenv/pratica2.v}

vlog -vlog01compat -work work +incdir+C:/Verilog/pratica2desenv {C:/Verilog/pratica2desenv/test_bench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  test_bench

add wave *
view structure
view signals
run -all
