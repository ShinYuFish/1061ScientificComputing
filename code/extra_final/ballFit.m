function output = ballFit(X,method)
    if (method == 1)
        data = X';
        A = [2*data(:,1),2*data(:,2),2*data(:,3),ones(length(data),1)];
        y = [data(:,1).^2+data(:,2).^2+data(:,3).^2];
        theta = A\y;
        theta(4) = sqrt(theta(4)+theta(1:3).^2);
        output = theta';
    else    
        data = X;
        x0 = mean(data(1,:)); y0 = mean(data(2,:)); z0 = mean(data(3,:));
        r0 = mean(sqrt((x0-data(1,:)).^2+(y0-data(2,:)).^2)+(z0-data(3,:)).^2);
        output = fminsearch(@(x)ball(data,x),[x0 ;y0 ;z0;r0]);        
    end
end

function func = ball(data)
     for i = 1:size(data,2)
         sum = sum + (sqrt((data(1,i)-x(1)).^2 + (data(2,i)-x(2)).^2)-x(3))^2;
     end
func = sum;
end