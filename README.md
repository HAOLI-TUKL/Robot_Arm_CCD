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
* Iteration goes along joint by joint and adjust the angles based on the errors of the position and orientation. To be precise, the error of the position is easily defined while the error of the orientation is defined as angle-axis represetation.
* The adjustment of an iteration is shown as below and the end effector gets closer to the desired configuration after the ajustment. More adjustments would be applied until the errors are small enough.

<img src="https://github.com/HAOLI-TUKL/Robot_Arm_CCD/blob/master/images/CCD_iteration.png" width="300" height="400" align="middle" />

# Example
The results for a 5-Dof and 7-Dof robot arm are shown below. Despite that the configurations of the results are not exactly same as that of the reference one, the position and orientation of the end effector are accurate placed as we expected after CCD.

<img src="https://github.com/HAOLI-TUKL/Robot_Arm_CCD/blob/master/images/example.png" width="600" height="300" align="middle" />

      
# Maintainers
githubleoleo leochina2018@163.com     
Tiehao Wang  
Yihsuan Cheng

# More info

# References
Kenwright B. Inverse kinematicscyclic coordinate descent (CCD)[J]. Journal of Graphics Tools, 2012, 16(4): 177-217.
