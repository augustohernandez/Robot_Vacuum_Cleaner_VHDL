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
wave modify -driver freeze -pattern constant -value 0 -starttime 0us -endtime 1000us Edit:/robot_fsm/angle_detect 
wave modify -driver freeze -pattern constant -value 1 -starttime 480us -endtime 500us Edit:/robot_fsm/angle_detect 
wave modify -driver freeze -pattern constant -value 0 -starttime 0us -endtime 1000us Edit:/robot_fsm/front_barr 
wave modify -driver freeze -pattern constant -value 1 -starttime 300us -endtime 500us Edit:/robot_fsm/front_barr 
wave modify -driver freeze -pattern constant -value 0 -starttime 0us -endtime 1000us Edit:/robot_fsm/angle_detect 
wave modify -driver freeze -pattern constant -value 1 -starttime 500us -endtime 520us Edit:/robot_fsm/angle_detect 
wave modify -driver freeze -pattern constant -value 1 -starttime 480us -endtime 500us Edit:/robot_fsm/front_barr 
wave modify -driver freeze -pattern constant -value 0 -starttime 0us -endtime 1000us Edit:/robot_fsm/front_barr 
wave modify -driver freeze -pattern constant -value 1 -starttime 480us -endtime 500us Edit:/robot_fsm/front_barr 
wave modify -driver freeze -pattern constant -value 0 -starttime 0us -endtime 1000us Edit:/robot_fsm/angle_detect 
wave modify -driver freeze -pattern constant -value 1 -starttime 700us -endtime 1000us Edit:/robot_fsm/reset 
wave modify -driver freeze -pattern constant -value 1 -starttime 460us -endtime 500us Edit:/robot_fsm/front_barr 
wave modify -driver freeze -pattern constant -value 1 -starttime 460us -endtime 1000us Edit:/robot_fsm/front_barr 
wave modify -driver freeze -pattern constant -value 1 -starttime 460us -endtime 500us Edit:/robot_fsm/back_barr 
wave modify -driver freeze -pattern constant -value 0 -starttime 0us -endtime 1000us Edit:/robot_fsm/light_zone 
wave modify -driver freeze -pattern constant -value 1 -starttime 480us -endtime 500us Edit:/robot_fsm/angle_detect 
wave modify -driver freeze -pattern constant -value 1 -starttime 520us -endtime 540us Edit:/robot_fsm/angle_detect 
WaveCollapseAll -1
wave clipboard restore
