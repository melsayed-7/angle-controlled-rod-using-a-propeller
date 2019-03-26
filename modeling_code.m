
plot(t,data);
ts = 17/500;  % this is the sampling time it is computed from the array t

data1 = iddata(data',[zeros(1,floor(4/ts)) ones(1,(557-floor(4/ts)))]',.034);  % this is processing the data to make it compatible with the transfer-function estimation funciton

g = tfest(data1,5,2);   % getting the transfer function and storing it in g
  

% We found that the best approximation to the system is a system of the
% fifth order

    