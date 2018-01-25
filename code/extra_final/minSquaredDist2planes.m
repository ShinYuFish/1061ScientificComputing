function output = minSquaredDist2planes(P) 
    num = (sqrt(P(1,:).^2 +P(2,:).^2 + P(3,:).^2));
    A = zeros(size(P,2),3); y = zeros(size(P,2),1);
    for i = 1:size(P,2)
        A(i,:) = [P(1,i)/num(i), P(2,i)/num(i), P(3,i)/num(i)];
        y(i) = -P(4,i)/num(i);
    end
    output = A\y;
end