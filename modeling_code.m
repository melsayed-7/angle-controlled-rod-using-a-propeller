plot(t,data);

zeta=0.3;
wn=4;

wd = wn*(1-zeta^2)^0.5
func = 1 - (exp(-zeta*wn*t)).*(cos(wd*t)+(zeta/(1-zeta^2)^0.5).*sin(wd*t));
%func = 1 - exp(-(6*t)/5).*(cos((2*91^(1/2).*t)/5) + (3*91^(1/2)*sin((2*91^(1/2)*t)/5))/91)
figure
plot(t,func);
figure
plot(t,data)
%%
g = etfe(data)


%%
error = Inf;

for zeta=0.9:0.01:0.3
    for wn = 1:0.01:5
        wd = wn*(1-zeta^2)^0.5;
        %func = 1 - (exp(-zeta*wn*t)).*(cos(wd*t)+(zeta/(1-zeta^2)^0.5).*sin(wd*t));
        func = 1 - exp(-(6*t)/5).*(cos((2*91^(1/2).*t)/5) + (3*91^(1/2)*sin((2*91^(1/2)*t)/5))/91);        
        current_error = (func-data)*(func-data)';
        if (current_error<error)
            error = current_error; 
            best_z = zeta;
            best_w = wn;
        end
        
    end
end


%% 

syms s 
f = wn^2/(s^3+2*zeta*wn*s^2+wn^2*s);
ilaplace(f)

