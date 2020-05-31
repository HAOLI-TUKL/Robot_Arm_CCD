function draw_robot(th1,th2,th3,th4,th5,th6,th7)
radius    = 25;  
len       = 60; 
joint_col = 0;
% ToRad= pi/180;
A=calculate_A(th1,th2,th3,th4,th5,th6,th7);
res=1;
tmp=zeros(4,4);

plot3(0,0,0,'ro'); 
for i=1:8
    
   
   res=res*A(i).A;  
%    if i==5
%         plot3(Link(i).p(1), Link(i).p(2),Link(i).p(3),'o');
%         plot3(res(1,4), res(2,4),res(3,4),'o');
%         hold on;
%    end
%    Connect3D(Link(i-1).p,Link(i).p,'b',2);
   Connect3D(tmp(:,4),res(:,4),'b',2);
   hold on;   
%    DrawCylinder(Link(i-1).p, Link(i-1).R * Link(i).az, radius,len, joint_col);
   DrawCylinder(tmp(:,4), tmp(1:3,1:3) * [0 0 1]', radius,len, joint_col);
   tmp=res;
   if i == 8
       origin=res(1:3,4);
       unit_x=res(1:3,1)/norm(res(1:3,1));
       unit_y=res(1:3,2)/norm(res(1:3,2));
       unit_z=res(1:3,3)/norm(res(1:3,3));
       x=origin+unit_x*50;
       y=origin+unit_y*50;  
       z=origin+unit_z*50;
       plot3([origin(1) x(1)],[origin(2) x(2) ],[origin(3) x(3)],'color','r');hold on;
       plot3([origin(1) y(1)],[origin(2) y(2) ],[origin(3) y(3)],'color','g');hold on;
       plot3([origin(1) z(1)],[origin(2) z(2) ],[origin(3) z(3)],'color','b');hold on;
   end
   hold on;
   view(45,45);
   axis([-800,800,-800,800,-400,1200]);
   xlabel('x');
   ylabel('y');
   zlabel('z');
   drawnow;
end

