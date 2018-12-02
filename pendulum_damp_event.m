function [t,w,te] = pendulum_damp_event(R,theta0,thetad0,gamma) 

%Setting initial conditions
g=9.81;
omega = sqrt(g/R);
T= 2*pi/omega;
% number of oscillations to graph
N = 10;
tspan = [0 N*T];
opts = odeset('events',@events,'refine',6); %Here for future event finder
r0 = [theta0 thetad0];
[t,w,te,ye,ie] = ode45(@proj,tspan,r0,opts,g,R,gamma);
end
%-------------------------------------------
%
function rdot = proj(t,r,g,R,gamma)
    rdot = [r(2); -g/R*sin(r(1))-gamma*r(2)];
end

function [value,isterminal,direction] = events(t,r,g,R,gamma)

if r(1)<0.0001
   value=0;
else
    value=1;
end
isterminal = 1;% stop  
direction = -1;
end