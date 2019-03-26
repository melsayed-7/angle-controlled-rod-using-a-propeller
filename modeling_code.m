plot(t,data);

z=0.3;
w=4;

wd = w*(1-z^2)^0.5
func = 1 - (exp(-z*w*t)).*(cos(wd*t)+(z/(1-z^2)^0.5).*sin(wd*t));
%func = 1 - exp(-(6*t)/5).*(cos((2*91^(1/2).*t)/5) + (3*91^(1/2)*sin((2*91^(1/2)*t)/5))/91)
figure
plot(t,func);
figure
plot(t,data)

%%
error = Inf;

for z=0.9:0.01:0.3
    for w = 1:0.01:5
        wd = w*(1-z^2)^0.5;
        func = 1 - (exp(-z*w*t)).*(cos(wd*t)+(z/(1-z^2)^0.5).*sin(wd*t));
        %func = 1 - exp(-(6*t)/5).*(cos((2*91^(1/2).*t)/5) + (3*91^(1/2)*sin((2*91^(1/2)*t)/5))/91);        
        current_error = (func-data)'
        current_error = sum(current_error);
        if (current_error<error)
            error = current_error; 
            zeta = z;
            wn = w;data
        end
        
    end
end


%% 

%syms s 
%f = w^2/(s^3+2*z*w*s^2+w^2*s);
%ilaplace(f)



%%


plot(t,data);
ts = 17/500;

%%
data1 = iddata(data',[zeros(1,floor(4/ts)) ones(1,(557-floor(4/ts)))]',.034);

g = tfest(data1,3,1);


