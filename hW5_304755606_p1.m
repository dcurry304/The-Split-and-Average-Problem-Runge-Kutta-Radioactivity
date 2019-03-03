%Problem 1 The Split and Average Function
%David Curry
%ID: 304755606
clear all;
clc;
%define initial conditions
x = [0 0 1 1];
y = [0 1 1 0];
xi = x;
yi = y;
%define weight vector
w = [0 1 1];
displace = 1;
dx = 0;
dy = 0;
%loop until displace is bigger than 10^-3
while displace > 10^-3
    xs = splitpts(x);
    ys = splitpts(y);
    xa = averagePts(xs,w);
    ya = averagePts(ys,w);
    x = xa;
    y = ya;
    dx = xa - xs;
    dy = ya - ys;
    displace = max(sqrt(dx.^2 + dy.^2));
end
%plot the graph
plot(xi,yi,'b.',x,y,'r.');
xlabel('x');
ylabel('y');
title('w = [0 1 1]');
    