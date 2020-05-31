% Figure 1 shows the beginning configuration, Figure2 shows the desired
% configuration while Figure 3 shows the configuration generated by CCD
% For developer : get desired pos first then get desired orientation ;iteration direction changes

%% ###### initialize ############
clear all;
torad=pi/180;
num_of_link=7;
flag=1;
% limit_all=0.006;
% limit=0.006;
count_iteration=0;
limit_pos=1.228;
limit_ori=0.2;
i=1;

%% ###### get initial pos and ori ############
[xdata,ydata,zdata,zdirection,T_init,newangle]=initialpose(0,-45,0,-90,0,90,0);
R_endeffector=T_init(1:3,1:3);
figure;draw_robot(newangle(1),newangle(2),newangle(3),newangle(4),newangle(5),newangle(6),newangle(7));
%% ###### get desired pos and ori ############
% joint angle limit(degree) : [-166 166][-101 101][-166 166][-176 -4][-166 166][-1 215][-166 166]
% [T_d,disp_angle]=desiredpose(45,45,45,45,90,45,0);      % example 1
% [T_d,disp_angle]=desiredpose(90,-45,-45,-90,90,-45,0);  % example 2
% [T_d,disp_angle]=desiredpose(30,-35,-45,-45,45,0,0);    % example 3
% [T_d,disp_angle]=desiredpose(45,-90,90,-45,-90,45,0);   % example 4
% [T_d,disp_angle]=desiredpose(90,-45,45,-45,90,45,0);     % example 5
% [T_d,disp_angle]=desiredpose(-45,15,-45,-145,10,145,10);% example 6
[T_d,disp_angle]=desiredpose(65,25,45,-75,60,145,10);   % example 7
pos_d=T_d(1:3,4);
ori_d=T_d(1:3,1:3);

%% ###### start CCD ############

R_th_r=ori_d*R_endeffector';
error_ori=acosd((R_th_r(1,1)+R_th_r(2,2)+R_th_r(3,3)-1)/2);
error_pos = dist([xdata(num_of_link+1) ydata(num_of_link+1) zdata(num_of_link+1)], pos_d);
while(error_pos>limit_pos||error_ori>limit_ori)
    if mod(flag,2) ==1
        while(error_pos>limit_pos)
            joint=num_of_link; 
            while(joint>0)
                %############ pos error calculate #################
                pe = [xdata(num_of_link+1); ydata(num_of_link+1);zdata(num_of_link+1)];
                pc = [xdata(joint); ydata(joint);zdata(joint)];
                a = (pe - pc)/norm(pe-pc);%a means an unitary vector from one joint to end effector
                b = (pos_d - pc)/norm(pos_d-pc);%b means an unitary vector from one joint to the desired point
                teta_pos = abs(acosd(dot(a, b)));%teta refers to the angle for a joint to revolute in order to approach the desired point
                %teta is always between [0 , 180)
                direction = cross(a',b');
                %map the desired angle to the angle of z aixs (for position)
                teta_pos=teta_pos*(direction/norm(direction))*(zdirection(1:3,joint)/norm(zdirection(1:3,joint)));
                newangle(joint) = newangle(joint)+teta_pos;
                newangle(joint) = joint_limit(newangle(joint),joint);
                [xdata,ydata,zdata,zdirection]=getangledata(newangle);
                R_endeffector=get_ori_end(newangle);
                joint=joint-1;
                count_iteration=count_iteration+1;
            end
            error_pos = dist([xdata(num_of_link+1) ydata(num_of_link+1) zdata(num_of_link+1)], pos_d);
        end
        while(error_ori>limit_ori)       
            joint=num_of_link; 
            while(joint>0)
                R_th_r=ori_d*R_endeffector';
                error_ori=acosd((R_th_r(1,1)+R_th_r(2,2)+R_th_r(3,3)-1)/2);
                if error_ori == 180
                    teta_ori=10;
                elseif error_ori == 0
                    r = [1 0 0]';
                    teta_ori=error_ori*(r)'*(zdirection(1:3,joint)/norm(zdirection(1:3,joint)));
                else
                    r=1/2/sin(error_ori*torad)*[R_th_r(3,2)-R_th_r(2,3);R_th_r(1,3)-R_th_r(3,1);R_th_r(2,1)-R_th_r(1,2)];
                    teta_ori=error_ori*(r)'*(zdirection(1:3,joint)/norm(zdirection(1:3,joint)));
                end
                newangle(joint) = newangle(joint)+teta_ori;
                newangle(joint) = joint_limit(newangle(joint),joint);
                [xdata,ydata,zdata,zdirection]=getangledata(newangle);%leo
                R_endeffector=get_ori_end(newangle);
                joint=joint-1;
                count_iteration=count_iteration+1;                       
            end
        end        
    else
        while(error_pos>limit_pos)
            joint=1;
            while(joint<=num_of_link)
                %############ pos error calculate #################
                pe = [xdata(num_of_link+1); ydata(num_of_link+1);zdata(num_of_link+1)];
                pc = [xdata(joint); ydata(joint);zdata(joint)];
                
                a = (pe - pc)/norm(pe-pc);%a means an unitary vector from one joint to end effector
                b = (pos_d - pc)/norm(pos_d-pc);%b means an unitary vector from one joint to the desired point
                teta_pos = abs(acosd(dot(a, b)));%teta refers to the angle for a joint to revolute in order to approach the desired point
                %teta is always between [0 , 180)
                direction = cross(a',b');
                %map the desired angle to the angle of z aixs (for position)
                teta_pos=teta_pos*(direction/norm(direction))*(zdirection(1:3,joint)/norm(zdirection(1:3,joint)));
                newangle(joint) = newangle(joint)+teta_pos;
                newangle(joint) = joint_limit(newangle(joint),joint);
                [xdata,ydata,zdata,zdirection]=getangledata(newangle);%leo
                R_endeffector=get_ori_end(newangle);
                joint=joint+1;
                count_iteration=count_iteration+1;                
            end
            error_pos = dist([xdata(num_of_link+1) ydata(num_of_link+1) zdata(num_of_link+1)], pos_d);
        end        
        while(error_ori>limit_ori)
            joint=1;
            while(joint<=num_of_link)
                R_th_r=ori_d*R_endeffector';
                error_ori=acosd((R_th_r(1,1)+R_th_r(2,2)+R_th_r(3,3)-1)/2);
                if error_ori == 180
                    teta_ori=10;
                elseif error_ori == 0
                    r = [1 0 0]';
                    teta_ori=error_ori*(r)'*(zdirection(1:3,joint)/norm(zdirection(1:3,joint)));
                else
                    r=1/2/sin(error_ori*torad)*[R_th_r(3,2)-R_th_r(2,3);R_th_r(1,3)-R_th_r(3,1);R_th_r(2,1)-R_th_r(1,2)];
                    teta_ori=error_ori*(r)'*(zdirection(1:3,joint)/norm(zdirection(1:3,joint)));
                    
                end                
                newangle(joint) = newangle(joint)+teta_ori;
                newangle(joint) = joint_limit(newangle(joint),joint);
                [xdata,ydata,zdata,zdirection]=getangledata(newangle);%leo
                R_endeffector=get_ori_end(newangle);
                joint=joint+1;
                count_iteration=count_iteration+1;                    
            end
        end
    end
    R_th_r=ori_d*R_endeffector';
    error_ori=acosd((R_th_r(1,1)+R_th_r(2,2)+R_th_r(3,3)-1)/2);
    error_pos = dist([xdata(num_of_link+1) ydata(num_of_link+1) zdata(num_of_link+1)], pos_d);
    flag=flag+1;
    pos_vector(i)=error_pos;
    ori_vector(i)=error_ori;
    i=i+1;    

end
figure;draw_robot(newangle(1),newangle(2),newangle(3),newangle(4),newangle(5),newangle(6),newangle(7));
figure;draw_robot(disp_angle(1),disp_angle(2),disp_angle(3),disp_angle(4),disp_angle(5),disp_angle(6),disp_angle(7));