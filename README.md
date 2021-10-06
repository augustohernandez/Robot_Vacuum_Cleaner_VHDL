# Robot_Vacuum_Cleaner_VHDL

Final project of the Digital Electronics subject of the Bachelor's Degree in Telecommunications Technology and Services Engineering. 

VHDL file with system encoding:\
**robot_fsm1.vhd:** \
.do files with the input signals used in the simulations:\
**ed_pra_casoA.do:** \
**ed_pra_casoB.do:** \
**ed_pra_casoC.do:** \

The robot has two very close light sensors that will indicate, by means of a signal, which part of the room is more illuminated. \

To avoid obstacles, it also has two built-in infrared sensors on the front and rear that activate a signal when they detect a very close obstacle. \

In addition, the device incorporates a reset button and another that will allow to start or stop the movement (start_stop). \

Once the system is initialized with a reset signal, the robot will remain stopped, in stand-by, waiting for the button to be pressed to start the movement. This will always start forward. To stop the robot, it will be necessary to press the start_stop button.  \

