function [xa] = averagePts(xs, w)
%this function finds the average from the three nearest neighbors.  The
%input is an array xs, and an array of weights w.
if sum(w) == 0
    error('Error: the sum of the w vector cannot be zero');
end
n = length(xs);
xa = zeros(1,n);
for k = 1:n
    if k == 1
        xa(k) = (w(1)/sum(w))*xs(n) + (w(2)/sum(w))*xs(k) + (w(3)/sum(w))*xs(k+1);
    elseif k == n
        xa(k) = (w(1)/sum(w))*xs(k-1) + (w(2)/sum(w))*xs(k) + (w(3)/sum(w))*xs(1);
    else
        xa(k) = (w(1)/sum(w))*xs(k-1) + (w(2)/sum(w))*xs(k) + (w(3)/sum(w))*xs(k+1);
    end
end
end
    
