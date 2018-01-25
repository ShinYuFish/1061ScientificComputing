function coef = hyperplaneFitViaTls(data)
    length = size(data,1);
    x = zeros(size(data)); mu = zeros(length);
    for i = 1: length
        mu(i) = mean(data(i,:));
        x(i,:) = [data(i,:)- mu(i)];
    end
    c = 1/size(data,2).*x*x';
    [V,D] = eig(c,'vector');
    [y,I] = sort(D,'descend');
    coef = V(:,I(end));
    sum = 0;
    for i = 1:length
        sum = sum -coef(i)*mu(i);
    end
    coef(length+1) = sum;

end