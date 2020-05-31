function [T,disp_angel] = desiredpose(th1,th2,th3,th4,th5,th6,th7)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
A=calculate_A(th1,th2,th3,th4,th5,th6,th7);
disp_angel=[th1,th2,th3,th4,th5,th6,th7];
res=1;
for i=1:8
   res=res*A(i).A;  
end
T=res;

end

