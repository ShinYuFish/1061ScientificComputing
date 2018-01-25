function out=scoreRank(x)
    [b ,out2] = sort(x);
    out = fliplr(out2);
end