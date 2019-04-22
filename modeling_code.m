
plot(t,data);
ts = 17/500;  % this is the sampling time it is computed from the array t

data1 = iddata(data(1:543)',input_2',.034);  % this is processing the data to make it compatible with the transfer-function estimation funciton

g = tfest(data1,2,0);   % getting the transfer function and storing it in g
  

% We found that the best approximation to the system is a system of the
% fifth order
transfer_fn = tf([g.Numerator],[g.Denominator])
x = step(transfer_fn)
plot(x)

