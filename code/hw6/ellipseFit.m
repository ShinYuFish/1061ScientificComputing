function [theta, sse]=ellipseFit(data)
    center0 = [mean(data(:,1)),mean(data(:,2))];	% Initial guess of the center
    center = fminsearch(@(x)sseOfEllipseFit(x, data), center0);	% Use fminsearch to find center
    [sse, radius]=sseOfEllipseFit(center, data);	% Use sseOfEllipseFit to obtain the final sse &amp; radius
    theta=[center, radius];
%% Function that returns SSE and the linear parameters
function [sse, radius]=sseOfEllipseFit(center, data)
    A = [(data(:,1)-center(1)).^2,(data(:,2)-center(2)).^2];
    y = ones(length(data),1);
    theta_sse = A\y;
    radius = [sqrt(1/theta_sse(1)),sqrt(1/theta_sse(2))];
    sse = sum((((data(:,1)-center(1))/radius(1)).^2 + ((data(:,2)-center(2))/radius(2)).^2 - 1).^2);
end
end 