function output = equalDistance(A, B)
	function dist = distfunc(A,B,x)
        dist = 0;
		for i =1:size(A,2)
			dist = dist + sqrt((x-A(1,i))^2 + A(2,i)^2);
		end
		for i = 1: size(B,2)
			dist = dist - sqrt((x-B(1,i))^2 + B(2,i)^2);
		end
	end
	output = fzero(@(x)distfunc(A,B,x),0);
end