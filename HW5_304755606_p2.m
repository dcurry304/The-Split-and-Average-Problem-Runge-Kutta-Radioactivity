%Problem 1 The Split and Average Function
%David Curry
%ID: 304755606
clear all;
clc;
%define initial condtions for the first timestep
tf = 15;
dt = 1;
t_steps = tf/dt;
%create arrays for the three methods, time, and the 3 differences
y = zeros(1,t_steps);
y(1) = 1;
y2 = zeros(1,t_steps);
y2(1) = 1;
y3 = zeros(1,t_steps);
y3(1) = 1;
t = linspace(0,15,t_steps);
y_actual = exp(-(log(2)/2.45)*t);
diff = zeros(1,t_steps);
diff2 = zeros(1,t_steps);
diff3 = zeros(1,t_steps);
%loop thru all values for all three methods, calling the advanceRK function
for k = 1:t_steps-1
    y(k+1) = advanceRK(y(k),dt,1);
    diff(k) = abs(y(k) - y_actual(k));
    y(k) = y(k+1);
    y2(k+1) = advanceRK(y2(k),dt,2);
    diff2(k) = abs(y2(k) - y_actual(k));
    y2(k) = y2(k+1);
    y3(k+1) = advanceRK(y3(k),dt,4);
    diff3(k) = abs(y3(k) - y_actual(k));
    y3(k) = y3(k+1);
end
%calculate errors for all 3 methods
error = mean(diff);
error2 = mean(diff2);
error3 = mean(diff3);
%repeat for the next time interval
dt2 = 0.1;
t_steps2 = tf/dt2;
y4 = zeros(1,t_steps2);
y4(1) = 1;
y5 = zeros(1,t_steps2);
y5(1) = 1;
y6 = zeros(1,t_steps2);
y6(1) = 1;
t2 = linspace(0,15,t_steps2);
y_actual2 = exp(-(log(2)/2.45)*t2);
diff4 = zeros(1,t_steps2);
diff5 = zeros(1,t_steps2);
diff6 = zeros(1,t_steps2);
%another for loop with a different number of steps to take
for k = 1:t_steps2-1
    y4(k+1) = advanceRK(y4(k),dt2,1);
    diff4(k) = abs(y4(k) - y_actual2(k));
    y4(k) = y4(k+1);
    y5(k+1) = advanceRK(y5(k),dt2,2);
    diff5(k) = abs(y5(k) - y_actual2(k));
    y5(k) = y5(k+1);
    y6(k+1) = advanceRK(y6(k),dt2,4);
    diff6(k) = abs(y6(k) - y_actual2(k));
    y6(k) = y6(k+1);
end
error4 = mean(diff4);
error5 = mean(diff5);
error6 = mean(diff6);
%repeat for the third time interval
dt3 = 0.01;
t_steps3 = tf/dt3;
y7 = zeros(1,t_steps3);
y7(1) = 1;
y8 = zeros(1,t_steps3);
y8(1) = 1;
y9 = zeros(1,t_steps3);
y9(1) = 1;
t3 = linspace(0,15,t_steps3);
y_actual3 = exp(-(log(2)/2.45)*t3);
diff7 = zeros(1,t_steps3);
diff8 = zeros(1,t_steps3);
diff9 = zeros(1,t_steps3);
%third for loop with different amount of steps
for k = 1:t_steps3-1
    y7(k+1) = advanceRK(y7(k),dt3,1);
    diff7(k) = abs(y7(k) - y_actual3(k));
    y7(k) = y7(k+1);
    y8(k+1) = advanceRK(y8(k),dt3,2);
    diff8(k) = abs(y8(k) - y_actual3(k));
    y8(k) = y8(k+1);
    y9(k+1) = advanceRK(y9(k),dt3,4);
    diff9(k) = abs(y9(k) - y_actual3(k));
    y9(k) = y9(k+1);
end
error7 = mean(diff7);
error8 = mean(diff8);
error9 = mean(diff9);
%print the error table
fprintf(' dt        RK1        RK2          RK4\n');
fprintf('%3.2f    %3.2e    %3.2e     %3.2e\n', dt, error, error2, error3);
fprintf('%3.2f    %3.2e    %3.2e     %3.2e\n', dt2, error4, error5, error6);
fprintf('%3.2f    %3.2e    %3.2e     %3.2e\n', dt3, error7, error8, error9);
%plot the first graph, with axises, title, and legend
plot(t,y_actual,'g',t,y,'b',t,y2,'r',t,y3,'k');
xlabel('Time (s)');
ylabel('Amount of Carbon-15 isotope');
title('Amount of Carbon-15 over time (dt = 1)');
legend('Actual','RK1', 'Rk2','RK3');
figure;
%plot the second graph
plot(t2,y_actual2,'g',t2,y4,'b',t2,y5,'r',t2,y6,'k');
xlabel('Time (s)');
ylabel('Amount of Carbon-15 isotope');
title('Amount of Carbon-15 over time (dt = 0.1)');
legend('Actual','RK1', 'Rk2','RK3');
figure;
%plot the third graph
plot(t3,y_actual3,'g',t3,y7,'b',t3,y8,'r',t3,y9,'k');
xlabel('Time (s)');
ylabel('Amount of Carbon-15 isotope');
title('Amount of Carbon-15 over time (dt = 0.01)');
legend('Actual','RK1', 'Rk2','RK3');
