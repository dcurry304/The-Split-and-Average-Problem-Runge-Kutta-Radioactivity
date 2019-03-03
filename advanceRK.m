function [y] = advanceRK(y, dt, method)
%this function determines the next value of a function from its
%differential equation and the Runge-Kutta methods. The input is the
%initial value y, the time step dt, and which method to choose.
if method == 1
    c1 = -dt*(log(2)/2.45)*y ;
    y_k1 = y + c1 ;
    
    y = y_k1;
elseif method == 2
    c1 = -dt*(log(2)/2.45)*y ;
    c2 = -dt*(log(2)/2.45)*(y + 0.5*c1);
    y_k1 = y + c2;
    
    y = y_k1
elseif method == 4
    c1 = -dt*(log(2)/2.45)*y ;
    c2 = -dt*(log(2)/2.45)*(y + 0.5*c1);
    c3 = -dt*(log(2)/2.45)*(y + 0.5*c2);
    c4 = -dt*(log(2)/2.45)*(y + c3);
    y_k1 = y + (1/6)*c1 + (1/3)*c2 + (1/3)*c3 + (1/6)*c4 ;
    
    y = y_k1
else 
    error('Error: Method must be 1,2, or 4');
end