function theta = planeFitViaLse(X)
    data = X';
    A = [data(:,1),data(:,2),ones(size(data,1),1)];
    y = data(:,3);
    theta = A\y;
end