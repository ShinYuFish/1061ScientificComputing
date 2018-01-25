function coef = lineFitViaTls(data)

    mu = [mean(data(1,:));mean(data(2,:))];
    x = [data(1,:)-mu(1);data(2,:)-mu(2)];
    c = 1/size(data,2).*x*x';
    [V,D] = eig(c,'vector');
    [y,I] = sort(D,'descend');
    coef(:) = V(I(end),:);
    coef(3) = -coef(1)*mu(1)-coef(2)*mu(2);
end
% 
% data = rand(2,20);
% ans=lineFitVia(data);
% coef=lineFitViaTls(data);