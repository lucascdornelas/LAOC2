onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pratica2/Resetn
add wave -noupdate /pratica2/Run
add wave -noupdate /pratica2/MemoryClock
add wave -noupdate /pratica2/ProcClock
add wave -noupdate -radix decimal /pratica2/processor/R0
add wave -noupdate -radix decimal /pratica2/processor/R1
add wave -noupdate -radix decimal /pratica2/processor/R2
add wave -noupdate -radix decimal /pratica2/processor/R3
add wave -noupdate -radix decimal /pratica2/processor/R4
add wave -noupdate -radix decimal /pratica2/processor/R5
add wave -noupdate -radix decimal /pratica2/processor/R6
add wave -noupdate -radix decimal /pratica2/processor/PC
add wave -noupdate -radix decimal /pratica2/processor/A
add wave -noupdate -radix decimal /pratica2/processor/G
add wave -noupdate /pratica2/processor/I
add wave -noupdate /pratica2/processor/IR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5398 ps} 0}
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
WaveRestoreZoom {550 ps} {1550 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 100000ps sim:/pratica2/Resetn 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 100000ps sim:/pratica2/Run 
wave create -driver freeze -pattern clock -initialvalue 0 -period 25ps -dutycycle 50 -starttime 0ns -endtime 100ns sim:/pratica2/MemoryClock 
wave create -driver freeze -pattern clock -initialvalue 1 -period 50ps -dutycycle 50 -starttime 0ns -endtime 100ns sim:/pratica2/ProcClock 
WaveCollapseAll -1
wave clipboard restore
