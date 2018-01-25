function theta = circleFit(data,method)
    if (method == 1)
        data = data';
        A = [2*data(:,1), 2*data(:,2),ones(size(data,1),1)];
        y = [data(:,1).^2 + data(:,2).^2];
        theta = A\y;
        theta(3) = sqrt(theta(3)+theta(1)^2+theta(2)^2);

    else   
        x0 = mean(data(1,:)); y0 = mean(data(2,:));
        r0 = mean(sqrt((x0-data(1,:)).^2+(y0-data(2,:)).^2));
        theta = fminsearch(@(x)circle(data,x),[x0 ;y0 ;r0]);    
    end
end
    
function output = circle(data,x)
    sum = 0;
        for i = 1:size(data,2)
            sum = sum + (sqrt((data(1,i)-x(1)).^2 + (data(2,i)-x(2)).^2)-x(3))^2;
        end
    output = sum;
end