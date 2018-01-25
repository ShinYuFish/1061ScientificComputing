function teamRank = myTeamRank(GD)
    A = 1./(1+exp(-GD));
    A(1:5:end)=0;
    B = bsxfun(@rdivide, A, sum(A));
    [V,D] = eig(B);
    n = V(:,1);
    teamRank = n/sum(n);
end