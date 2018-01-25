function output = myTransform(vec,theta,mode)
if(strcmp(mode,'rotate'))
    output = [cos(theta) -sin(theta) ; sin(theta) cos(theta)]*vec ;
    
else
    [m,n]=size(vec);
    for i = 1:n
        output(1,i) = vec(1,i)-2*(-tan(theta)*vec(1,i)+vec(2,i))/((tan(theta))^2+1)*(-tan(theta));
        output(2,i) = vec(2,i)-2*(-tan(theta)*vec(1,i)+vec(2,i))/((tan(theta))^2+1);
    end
end