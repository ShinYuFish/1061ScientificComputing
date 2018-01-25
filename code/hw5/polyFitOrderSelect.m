function [bestOrder, vRmse, tRmse]=polyFitOrderSelect(data, maxOrder)
%polyFitOrderSelect: Polynomial order selection based on LOOCV (leave-one-out cross validation)
%
%	Usage: [bestOrder, vRmse, tRmse]=polyFitOrderSelect(data, maxOrder)

dataCount=size(data, 2);	% Count of data pairs
orders=0:maxOrder;				% All possible orders
orderCount=length(orders);		% Count of orders for test
tRmse=zeros(orderCount, 1);		% Training RMSE (root mean squared error)
vRmse=zeros(orderCount, 1);		% Validation RMSE (root mean squared error)
tSse=zeros(dataCount, 1);		% SSE (sum of squared error) of training data of LOOCV for a specific order
vSse=zeros(dataCount, 1);		% SSE (sum of squared error) of validation data of LOOCV for a specific order

for i=1:orderCount
	order=orders(i);
	for j=1:dataCount	% Perform LOOCV
		vData=data(:,j);		% Validation data (which is held out)
		tData=data; tData(:,j)=[];	% Training data
		
        mu = mean(tData,2);	% Find mu and sigma of vData
		sigma = std(tData,0,2);% Find mu and sigma of vData
        tData(1,:)=(tData(1,:)-mu(1))/sigma(1);	% Perform z-normalization on the input part of tData
		vData(1,:)=(vData(1)-mu(1))/sigma(1);	% Perform z-normalization on the input part of vData (using the mu and sigma from tData)
	    
        theta = polyfit(tData(1,:),tData(2,:),order);
        tData_val = polyval(theta,tData(1,:));
        vData_val = polyval(theta,vData(1));
		tSse(j)=sum((tData(2,:)-tData_val).^2);	% Compute SSE of tData
		vSse(j)=(vData(2)-vData_val).^2;	% Compute SSE of vData
	end
	tRmse(i)=sqrt(sum(tSse)/(dataCount*(dataCount-1)));
	vRmse(i)=sqrt(sum(vSse)/dataCount);
end
[minValue, minIndex]=min(vRmse);
bestOrder=orders(minIndex);
end