function [minValue, minIndex] = minxy(matrix)
% implement your code here
    [minValue,I] = min(matrix(:));
    [minIndex(1),minIndex(2)] = ind2sub(size(matrix),I);
end