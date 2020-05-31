function angle=joint_limit(angle,joint)
ToRad=pi/180;
ToDeg=180/pi;
angle= angle*ToRad;
    switch joint
        case 1
            fprintf('case 1\n');
            if angle > 2.8973
                angle = 2.8973;%166.0031
            elseif angle < -2.8973  
                angle =  -2.8973;%-166.0031
            end
        case 2
            fprintf('case 2\n');

            if angle > 1.7628
                angle = 1.7628;%101.0010
            elseif angle < -1.7628  
                angle =  -1.7628;%-101.0010
            end
        case 3
            fprintf('case 3\n');

            if angle > 2.8973
                angle = 2.8973;
            elseif angle < -2.8973  
                angle =  -2.8973;
            end                
        case 4
            fprintf('case 4\n');

            if angle > -0.0698
                angle = -0.0698;%-3.9992
            elseif angle < -3.0718  
                angle =  -3.0718;%-176.0012
            end
        case 5
            fprintf('case 5\n');

            if angle > 2.8973
                angle = 2.8973;
            elseif angle < -2.8973  
                angle =  -2.8973;
            end
        case 6
            fprintf('case 6\n');
            if angle > 3.7525
                angle = 3.7525;%215.0024
            elseif angle < -0.0175  
                angle =  -0.0175;%-1.0027
            end
        case 7
            fprintf('case 7\n');
            if angle > 2.8973
                angle = 2.8973;
            elseif angle < -2.8973  
                angle =  -2.8973;
            end
    end
angle = angle*ToDeg;
end