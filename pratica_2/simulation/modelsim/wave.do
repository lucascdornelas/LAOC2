onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color White -radix decimal /pratica2/MClock
add wave -noupdate -color White -radix decimal /pratica2/PClock
add wave -noupdate -color White -radix decimal /pratica2/Resetn
add wave -noupdate -color White -radix decimal /pratica2/Run
add wave -noupdate -color Yellow -radix unsigned /pratica2/processor/R0
add wave -noupdate -color Gray75 -radix unsigned /pratica2/processor/R1
add wave -noupdate -color Cyan -radix unsigned /pratica2/processor/R2
add wave -noupdate -color Green -radix unsigned /pratica2/processor/R3
add wave -noupdate -color Red -radix unsigned /pratica2/processor/R4
add wave -noupdate -color {Dark Orchid} -radix unsigned /pratica2/processor/R5
add wave -noupdate -color Gray75 -radix unsigned /pratica2/processor/R6
add wave -noupdate -color Cyan -radix unsigned /pratica2/processor/R7
add wave -noupdate -color {Spring Green} -radix unsigned /pratica2/processor/A
add wave -noupdate -color Red -radix unsigned /pratica2/processor/G
add wave -noupdate -color White /pratica2/processor/IR
add wave -noupdate -color White /pratica2/processor/I
add wave -noupdate -color White /pratica2/BusWires
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {1 ns}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 25ps -dutycycle 50 -starttime 0ps -endtime 100000ps sim:/pratica2/MClock 
wave create -driver freeze -pattern clock -initialvalue 1 -period 50ps -dutycycle 50 -starttime 0ps -endtime 100000ps sim:/pratica2/PClock 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 100000ps sim:/pratica2/Resetn 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 100000ps sim:/pratica2/Run 
WaveCollapseAll -1
wave clipboard restore
