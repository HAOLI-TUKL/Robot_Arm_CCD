function y=calculate_A(th1,th2,th3,th4,th5,th6,th7)

Link=build_parameters_table(th1,th2,th3,th4,th5,th6,th7);
% th=[Link(1).th,Link(2).th,Link(3).th,Link(4).th,Link(5).th];
A(1)= struct('name','transform matrix from world coodinate to frame 0' , 'A',  0); 
A(2)= struct('name','transform matrix from frame 0 to 1' , 'A',  0); 
A(3)= struct('name','transform matrix from frame 1 to 2' , 'A',  0); 
A(4)= struct('name','transform matrix from frame 2 to 3' , 'A',  0); 
A(5)= struct('name','transform matrix from frame 3 to 4' , 'A',  0); 
A(6)= struct('name','transform matrix from frame 4 to 5' , 'A',  0); 
A(7)= struct('name','transform matrix from frame 5 to 6' , 'A',  0); 
A(8)= struct('name','transform matrix from frame 6 to 7' , 'A',  0); 

for i=1:8
    A(i).A=[cos(Link(i).th) -sin(Link(i).th)*cos(Link(i).alf) sin(Link(i).th)*sin(Link(i).alf) Link(i).a*cos(Link(i).th)
        sin(Link(i).th) cos(Link(i).th)*cos(Link(i).alf) -cos(Link(i).th)*sin(Link(i).alf) Link(i).a*sin(Link(i).th)
        0 sin(Link(i).alf) cos(Link(i).alf) Link(i).d
        0 0 0 1];
end

y=A;