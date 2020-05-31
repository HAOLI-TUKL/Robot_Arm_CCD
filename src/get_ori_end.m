function R_endeffector=get_ori_end(new_angle)

A=calculate_A(new_angle(1),new_angle(2),new_angle(3),new_angle(4),new_angle(5),new_angle(6),new_angle(7));

res=1;
for i=1:length(new_angle)+1
       
   res=res*A(i).A; 
   
end

R_endeffector=res(1:3,1:3);