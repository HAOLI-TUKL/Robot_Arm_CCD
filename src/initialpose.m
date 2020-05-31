function [xdata,ydata,zdata,zdirection,T,newangle] = initialpose(th1,th2,th3,th4,th5,th6,th7)
xdata=zeros(1,8);
ydata=zeros(1,8);
zdata=zeros(1,8);
zdirection=zeros(3,8);
newangle=[th1,th2,th3,th4,th5,th6,th7];
A=calculate_A(th1,th2,th3,th4,th5,th6,th7);
T=eye(4,4);
for i= 1:8
    T=T*A(i).A;
    xdata(i)=T(1,4);
    ydata(i)=T(2,4);
    zdata(i)=T(3,4);
    zdirection(1:3,i)=T(1:3,3);
   
end


end

