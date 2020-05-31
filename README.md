# Robot_Arm_CCD
An implementation of  inverse kinematics , named Cyclic Coordinate Descent, for a 7 Dof robot arm(FRANKA EMIKA)

# Prerequisite
- Matlab

# Install   
`git clone https://github.com/HAOLI-TUKL/Robot_Arm_CCD.git`       

# Usage
1. enter the workspace
`cd src`    
2. enter the workspace
`run main.m`


# Technical Overview
* Inverse kinematics basically determines position and orientation of end-effector given angles of each joint. Cyclic Coordinate Descent(CCD) is one of the methods to solve the problem effectively. In comparison with other inverse kinematics algorithm, such as Jacobian Inverse and Jacobian Transpose, CCD can take the joint limits into the consideration and is able to be robust to singularity. 

* my_car package and my_controller mainly deals with the vehicle model and driver for the simulation in Gazebo.
# Example
![image](https://github.com/githubleoleo/autonomous_exploration/blob/master/images/astar.png)

video of the simulation can be found :https://www.youtube.com/watch?v=Z0UcYPeM29c
    
      
# Maintainers
githubleoleo leochina2018@163.com     
Tiehao Wang

# More info

# References
Yamauchi, Brian. “A frontier-based approach for autonomous exploration.” Proceedings 1997 IEEE International Symposium on Computational Intelligence in Robotics and Automation CIRA'97. 'Towards New Computational Principles for Robotics and Automation' (1997): 146-151.
