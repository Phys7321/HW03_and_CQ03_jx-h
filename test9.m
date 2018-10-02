close all

[period,sol] = pendulum(1,0.5,4, 0);

figure
plot(sol(:,1), sol(:,2),'.')
% figure
hold
plot(sol(:,1), sol(:,3),'r.')
xlim([0 5])