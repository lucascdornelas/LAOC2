transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/lucas/Documents/GitHub/LAOC2/pratica_4/parte1/parte1maq2 {C:/Users/lucas/Documents/GitHub/LAOC2/pratica_4/parte1/parte1maq2/parte1maq2.v}

