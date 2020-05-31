function y=build_parameters_table(th1,th2,th3,th4,th5,th6,th7)


ToRad= pi/180;
 
% 
% Link(1)= struct('name','link 0' , 'th',  0, 'd', 0, 'a', 0, 'alf',0*ToRad); % from world coordinate to frame 0(joint 1,which on the groud(groud is link0))
% Link(2)= struct('name','link 1' , 'th',  th1*ToRad, 'd', 0.333, 'a', 0, 'alf',90*ToRad); 
% Link(3)= struct('name','link 2' , 'th',  th2*ToRad, 'd', 0, 'a', 0, 'alf',-90*ToRad); 
% Link(4)= struct('name','link 3' , 'th',  th3*ToRad, 'd', 0.3160, 'a', 0.0825, 'alf',90*ToRad); 
% Link(5)= struct('name','link 4' , 'th',  th4*ToRad, 'd', 0, 'a', -0.0825, 'alf',-90*ToRad); 
% Link(6)= struct('name','link 5' , 'th',  th5*ToRad, 'd', 0.3840, 'a', 0, 'alf',90*ToRad); 
% Link(7)= struct('name','link 6' , 'th',  th6*ToRad, 'd', 0, 'a', 0.088, 'alf',90*ToRad); 
% Link(8)= struct('name','link 7' , 'th',  th7*ToRad, 'd', 0.1070, 'a', 0, 'alf',0);


Link(1)= struct('name','link 0' , 'th',  0, 'd', 0, 'a', 0, 'alf',0*ToRad); % from world coordinate to frame 0(joint 1,which on the groud(groud is link0))
Link(2)= struct('name','link 1' , 'th',  th1*ToRad, 'd', 333, 'a', 0, 'alf',90*ToRad); 
Link(3)= struct('name','link 2' , 'th',  th2*ToRad, 'd', 0, 'a', 0, 'alf',-90*ToRad); 
Link(4)= struct('name','link 3' , 'th',  th3*ToRad, 'd', 316, 'a', 88, 'alf',90*ToRad); 
Link(5)= struct('name','link 4' , 'th',  th4*ToRad, 'd', 0, 'a', -88, 'alf',-90*ToRad); 
Link(6)= struct('name','link 5' , 'th',  th5*ToRad, 'd', 384, 'a', 0, 'alf',90*ToRad); 
Link(7)= struct('name','link 6' , 'th',  th6*ToRad, 'd', 0, 'a', 88, 'alf',90*ToRad); 
Link(8)= struct('name','link 7' , 'th',  th7*ToRad, 'd', 107, 'a', 0, 'alf',0);


y=Link;
