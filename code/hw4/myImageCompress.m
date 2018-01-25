function out= myImageCompress(inImage, centerCount)
    [m, n, p]=size(inImage);
    %rows for RGB value of each point in block; columns for numbers of 8x8
    %blocks member of the image
    data = zeros(8*8*3,m*n/64); 
    out = [];
    
    %separating block data into a matrix for k-means clustering by using
    %two for loops
    index = 1;
    for i = 1:m/8
        for j = 1:n/8
            block = inImage((i-1)*8+1:i*8,(j-1)*8+1:j*8,:);
            block = reshape(block,192,1);
            data(:,index) = block;
            index = index +1;
        end
    end
        
    data = double(data);
    center = kMeansClustering(data,centerCount); %center is a 192x64 matrix
    distMat = distPairwise(center,data); %distMat is a 64x3626 matrix
    [minValue,minIndex] = min(distMat);
    % the min function will return the minimum value in each
    % column(corresponding to each point in this matrix)
    % end up getting each points nearest k-means clustering center
    
    index = 1;
    for i = 1:m/8
        for j = 1:n/8
            X2 = reshape(center(:,minIndex(index)),8,8,3);
            out((i-1)*8+1:i*8,(j-1)*8+1:j*8,:) = X2;
            index = index+1;
        end
    end 
end

