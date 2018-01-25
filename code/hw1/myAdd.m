function output = myAdd(a, b)
[A1,A2] = size(a);[B1,B2] = size(b);
if abs(A1-B1) ~= 0
    if A1 > B1
        b(B1+1:B1+abs(A1-B1),:) = 0;
    else
        a(A1+1:A1+abs(A1-B1),:) = 0;
    end
end
if abs(A2-B2) ~= 0
    if A2 > B2
        b(:,B2+1:B2+abs(A2-B2)) = 0;
    else
        a(:,A2+1:A2+abs(A2-B2)) = 0;
    end
end
output = a+b;
end