function [xs] = splitpts(x)
%this function doubles the number of points by adding new points in
%each midpoint.  The input is a vector x, and the output is a vector of twice
%the length of x.
n = length(x);
xs = zeros(1,2*n);
    for k = 1:n
        xs((2*k)-1) = x(k);
    end
    for k = 1:2*n
        if mod(k,2) == 0 && k ~= 2*n
            xs(k) = (xs(k-1) + xs(k+1))/2;
        elseif k == 2*n
            xs(k) = (xs(1) + xs(k-1))/2;
        else
        end
    end
end

       