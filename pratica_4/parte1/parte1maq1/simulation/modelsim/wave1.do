onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /parte1maq1/clock
add wave -noupdate /parte1maq1/counter
add wave -noupdate -divider Operação
add wave -noupdate -radix unsigned /parte1maq1/readMiss
add wave -noupdate -radix unsigned /parte1maq1/readHit
add wave -noupdate -radix unsigned /parte1maq1/writeMiss
add wave -noupdate -radix unsigned /parte1maq1/writeHit
add wave -noupdate -divider Estado
add wave -noupdate -radix unsigned /parte1maq1/invalid
add wave -noupdate -radix unsigned /parte1maq1/exclusive
add wave -noupdate -radix unsigned /parte1maq1/shared
add wave -noupdate -divider Mensagem
add wave -noupdate -radix unsigned /parte1maq1/emptyMessage
add wave -noupdate -radix unsigned /parte1maq1/placeReadMissOnBus
add wave -noupdate -radix unsigned /parte1maq1/placeInvalidateOnBus
add wave -noupdate -radix unsigned /parte1maq1/placeWriteMissOnBus
add wave -noupdate -divider Ação
add wave -noupdate -radix unsigned /parte1maq1/emptyAction
add wave -noupdate -radix unsigned /parte1maq1/writeBackBlock
add wave -noupdate -radix unsigned /parte1maq1/writeBackCacheBlock
add wave -noupdate -divider Estados
add wave -noupdate -radix unsigned -childformat {{{/parte1maq1/estado[1]} -radix unsigned} {{/parte1maq1/estado[0]} -radix unsigned}} -subitemconfig {{/parte1maq1/estado[1]} {-radix unsigned} {/parte1maq1/estado[0]} {-radix unsigned}} /parte1maq1/estado
add wave -noupdate -radix unsigned -childformat {{{/parte1maq1/mensagem[1]} -radix unsigned} {{/parte1maq1/mensagem[0]} -radix unsigned}} -subitemconfig {{/parte1maq1/mensagem[1]} {-radix unsigned} {/parte1maq1/mensagem[0]} {-radix unsigned}} /parte1maq1/mensagem
add wave -noupdate -radix unsigned -childformat {{{/parte1maq1/acao[1]} -radix unsigned} {{/parte1maq1/acao[0]} -radix unsigned}} -subitemconfig {{/parte1maq1/acao[1]} {-radix unsigned} {/parte1maq1/acao[0]} {-radix unsigned}} /parte1maq1/acao
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {990 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 67
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1208 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 10000ps sim:/parte1maq1/clock 
wave create -driver freeze -pattern counter -startvalue 00 -endvalue 11 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 1 0 -starttime 0ps -endtime 10000ps sim:/parte1maq1/counter 
WaveCollapseAll -1
wave clipboard restore
