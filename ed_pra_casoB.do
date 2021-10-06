onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /robot_fsm/clock
add wave -noupdate /robot_fsm/reset
add wave -noupdate /robot_fsm/front_barr
add wave -noupdate /robot_fsm/back_barr
add wave -noupdate /robot_fsm/start_stop
add wave -noupdate /robot_fsm/light_zone
add wave -noupdate /robot_fsm/angle_detect
add wave -noupdate /robot_fsm/mov
add wave -noupdate /robot_fsm/dir_mov
add wave -noupdate /robot_fsm/turn
add wave -noupdate /robot_fsm/dir_turn
add wave -noupdate /robot_fsm/alarm
add wave -noupdate /robot_fsm/angle_detect
add wave -noupdate /robot_fsm/clock
add wave -noupdate /robot_fsm/reset
add wave -noupdate /robot_fsm/front_barr
add wave -noupdate /robot_fsm/back_barr
add wave -noupdate /robot_fsm/start_stop
add wave -noupdate /robot_fsm/light_zone
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1000854829 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1048576 ns}
view wave 
wave clipboard store
wave create -driver freeze -pattern repeater -initialvalue 0 -period 10us -sequence { 1 0  } -repeat 1 -starttime 0us -endtime 1000us sim:/robot_fsm/angle_detect 
wave create -driver freeze -pattern clock -initialvalue 0 -period 20us -dutycycle 50 -starttime 0us -endtime 1000us sim:/robot_fsm/clock 
wave create -driver freeze -pattern constant -value 0 -starttime 20us -endtime 1000us sim:/robot_fsm/reset 
wave modify -driver freeze -pattern constant -value 1 -starttime 20us -endtime 1000us Edit:/robot_fsm/reset 
wave modify -driver freeze -pattern constant -value 0 -starttime 0us -endtime 1000us Edit:/robot_fsm/reset 
wave create -driver freeze -pattern constant -value 1 -starttime 0us -endtime 1000us sim:/robot_fsm/front_barr 
wave create -driver freeze -pattern constant -value 0 -starttime 0us -endtime 1000us sim:/robot_fsm/back_barr 
wave create -driver freeze -pattern constant -value 1 -starttime 0us -endtime 1000us sim:/robot_fsm/start_stop 
wave create -driver freeze -pattern constant -value 0 -starttime 0us -endtime 1000us sim:/robot_fsm/light_zone 
wave modify -driver freeze -pattern constant -value 1 -starttime 500us -endtime 1000us Edit:/robot_fsm/front_barr 
wave modify -driver freeze -pattern constant -value 0 -starttime 500us -endtime 1000us Edit:/robot_fsm/front_barr 
wave modify -driver freeze -pattern constant -value 0 -starttime 0us -endtime 500us Edit:/robot_fsm/light_zone 
wave modify -driver freeze -pattern constant -value 1 -starttime 0us -endtime 500us Edit:/robot_fsm/light_zone 
wave modify -driver freeze -pattern constant -value 1 -starttime 500us -endtime 1000us Edit:/robot_fsm/light_zone 
wave modify -driver freeze -pattern repeater -initialvalue 0 -period 500us -sequence { 0 1  } -repeat forever -starttime 0us -endtime 1000us Edit:/robot_fsm/light_zone 
wave modify -driver freeze -pattern constant -value 1 -starttime 500us -endtime 520us Edit:/robot_fsm/angle_detect 
wave modify -driver freeze -pattern constant -value 1 -starttime 0us -endtime 1000us Edit:/robot_fsm/angle_detect 
wave modify -driver freeze -pattern constant -value 1 -starttime 480us -endtime 500us Edit:/robot_fsm/angle_detect 
wave modify -driver freeze -pattern constant -value 0 -starttime 0us -endtime 1000us Edit:/robot_fsm/angle_detect 
wave modify -driver freeze -pattern constant -value 1 -starttime 480us -endtime 500us Edit:/robot_fsm/angle_detect 
WaveCollapseAll -1
wave clipboard restore
