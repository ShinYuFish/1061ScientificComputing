function [minDistance, dpPath] = myPvAlign(p, q)
    m = length(p); n = length(q);
    dpPath = zeros(2,m);
    D = zeros(m+1,n+1); d = zeros(m+1,n+1);map = zeros(m+1,n+1);
    D(1,:) = inf; D(:,1) = inf;
    %calculating distance between notes
    for j = 2:n+1
        d(2:end,j) = abs(p(:)-q(j-1));
    end
    %recursion
    for j = 2:n+1
        for i = 2:m+1
            [min_d,choice] = min([D(i-1,j),D(i-1,j-1)]);
            D(i,j) = d(i,j) + min_d;
            map(i,j) = choice;
            D(2,2) = abs(p(1)-q(1));
        end
    end
    [minDistance,minindex] = min(D(m+1,:));
    dpPath(:,m) = [m,minindex-1];
    for k = m-1:-1:1
          current = dpPath(2,k+1);
          if map(k+2,current+1) == 1
              dpPath(:,k) = [k,current];
          else
              dpPath(:,k) = [k,current-1];
          end
    end
end