transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/lucas/Desktop/LAOC2/pratica_2 {C:/Users/lucas/Desktop/LAOC2/pratica_2/tlb.v}
vlog -vlog01compat -work work +incdir+C:/Users/lucas/Desktop/LAOC2/pratica_2 {C:/Users/lucas/Desktop/LAOC2/pratica_2/pratica2.v}
vlog -vlog01compat -work work +incdir+C:/Users/lucas/Desktop/LAOC2/pratica_2 {C:/Users/lucas/Desktop/LAOC2/pratica_2/proc.v}
vlog -vlog01compat -work work +incdir+C:/Users/lucas/Desktop/LAOC2/pratica_2 {C:/Users/lucas/Desktop/LAOC2/pratica_2/upcount.v}
vlog -vlog01compat -work work +incdir+C:/Users/lucas/Desktop/LAOC2/pratica_2 {C:/Users/lucas/Desktop/LAOC2/pratica_2/regn.v}
vlog -vlog01compat -work work +incdir+C:/Users/lucas/Desktop/LAOC2/pratica_2 {C:/Users/lucas/Desktop/LAOC2/pratica_2/multiplex.v}
vlog -vlog01compat -work work +incdir+C:/Users/lucas/Desktop/LAOC2/pratica_2 {C:/Users/lucas/Desktop/LAOC2/pratica_2/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/lucas/Desktop/LAOC2/pratica_2 {C:/Users/lucas/Desktop/LAOC2/pratica_2/ramlpm.v}
vlog -vlog01compat -work work +incdir+C:/Users/lucas/Desktop/LAOC2/pratica_2 {C:/Users/lucas/Desktop/LAOC2/pratica_2/romlpm.v}
vlog -vlog01compat -work work +incdir+C:/Users/lucas/Desktop/LAOC2/pratica_2 {C:/Users/lucas/Desktop/LAOC2/pratica_2/counterlpm.v}
vlog -vlog01compat -work work +incdir+C:/Users/lucas/Desktop/LAOC2/pratica_2 {C:/Users/lucas/Desktop/LAOC2/pratica_2/dec3to8.v}
vlog -vlog01compat -work work +incdir+C:/Users/lucas/Desktop/LAOC2/pratica_2 {C:/Users/lucas/Desktop/LAOC2/pratica_2/regn_IR.v}
vlog -vlog01compat -work work +incdir+C:/Users/lucas/Desktop/LAOC2/pratica_2 {C:/Users/lucas/Desktop/LAOC2/pratica_2/instFetch.v}

