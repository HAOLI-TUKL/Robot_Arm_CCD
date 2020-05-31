function error=get_error(A,pos_d)
T=eye(4,4);
for i= 1:8
    T=T*A(i).A;
end
pos_end=T(1:3,4);
error = dist(pos_d ,pos_end);
