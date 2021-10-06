# Robot_Vacuum_Cleaner_VHDL

Final project of the Digital Electronics subject of the Bachelor's Degree in Telecommunications Technology and Services Engineering. 

VHDL file with system encoding:\
**robot_fsm1.vhd:** \
.do files with the input signals used in the simulations:\
**ed_pra_casoA.do:** \
**ed_pra_casoB.do:** \
**ed_pra_casoC.do:** 

The robot has two very close light sensors that will indicate, by means of a signal, which part of the room is more illuminated.

To avoid obstacles, it also has two built-in infrared sensors on the front and rear that activate a signal when they detect a very close obstacle.

In addition, the device incorporates a reset button and another that will allow to start or stop the movement (start_stop).

Once the system is initialized with a reset signal, the robot will remain stopped, in stand-by, waiting for the button to be pressed to start the movement. This will always start forward. To stop the robot, it will be necessary to press the start_stop button.

In the case of detecting an obstacle in the front while the robot is moving in this direction, it will stop and change the direction of travel until the front sensor indicates again that there is no obstacle.


Then it will begin to rotate towards the side that is more illuminated. You want the robot not to deviate too much from its path and, therefore, the turn should only be done for 1/8 of a turn. Once you have turned, the forward motion will continue. It can be considered that there will be no obstacles in the front, since it has started to turn when it has been detected that there was no obstacle. 

To know the turn made by the robot, the system will have a signal that is activated and deactivated each time a 1/8 turn turn is detected.

It may happen that, while the robot is moving backwards, an object is detected at the rear. This would mean that the robot has an obstacle on either side. In this case, you want the robot to rotate 90 ° (2/8 of a turn) towards the brightest side.

If no obstacle is detected at the front afterwards, it will move forward again. Otherwise, it will activate the alarm and stand still waiting for the situation to be resolved externally and the system to start up by means of the alarm signal.
reset.

If the start_stop button is pressed while the robot is moving (forward or backward), it will have to stop and it will return to the initial state waiting to receive the order to start the movement. On the other hand, if the robot was turning or was in an alarm situation, it will be ignored. Note that when the button is pressed, it may be active for more than one clock cycle. 

