function [t,w,te] = pendulum_damp(R,theta0,thetad0,gamma) 


%Setting initial conditions
g=9.81;
omega = sqrt(g/R);
T= 2*pi/omega;
% number of oscillations to graph
N = 10;
tspan = [0 N*T];
opts = odeset('refine',6); %Here for future event finder
r0 = [theta0 thetad0];
[t,w] = ode45(@proj,tspan,r0,opts,g,R,gamma);
end
%-------------------------------------------
%
function rdot = proj(t,r,g,R,gamma)
    rdot = [r(2); -g/R*sin(r(1))-gamma*r(2)];
end