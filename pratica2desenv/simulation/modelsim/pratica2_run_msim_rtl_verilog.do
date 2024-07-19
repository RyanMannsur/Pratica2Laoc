transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/aneli/Downloads/pratica2desenv {C:/Users/aneli/Downloads/pratica2desenv/pratica2.v}
vlog -vlog01compat -work work +incdir+C:/Users/aneli/Downloads/pratica2desenv {C:/Users/aneli/Downloads/pratica2desenv/mux.v}
vlog -vlog01compat -work work +incdir+C:/Users/aneli/Downloads/pratica2desenv {C:/Users/aneli/Downloads/pratica2desenv/addSub.v}
vlog -vlog01compat -work work +incdir+C:/Users/aneli/Downloads/pratica2desenv {C:/Users/aneli/Downloads/pratica2desenv/upcount.v}
vlog -vlog01compat -work work +incdir+C:/Users/aneli/Downloads/pratica2desenv {C:/Users/aneli/Downloads/pratica2desenv/controle.v}
vlog -vlog01compat -work work +incdir+C:/Users/aneli/Downloads/pratica2desenv {C:/Users/aneli/Downloads/pratica2desenv/registrador.v}

