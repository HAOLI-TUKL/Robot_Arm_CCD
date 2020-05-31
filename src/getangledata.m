function [xdata,ydata,zdata,zdirection]=getangledata(new_angle)


A=calculate_A(new_angle(1),new_angle(2),new_angle(3),new_angle(4),new_angle(5),new_angle(6),new_angle(7));
xdata=zeros(1,length(new_angle)+1);
ydata=zeros(1,length(new_angle)+1);
zdata=zeros(1,length(new_angle)+1);
zdirection=zeros(3,length(new_angle)+1);%store the directions of the z axis of joints

res=1;
for i=1:length(new_angle)+1
       
   res=res*A(i).A;  
   xdata(i)=res(1,4);
   ydata(i)=res(2,4);
   zdata(i)=res(3,4);
   zdirection(1:3,i)=res(1:3,3);
   

end

