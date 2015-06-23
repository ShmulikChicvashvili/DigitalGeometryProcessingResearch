function [  ] = adjust_caxis( v, extreme )
%ADJUST_CAXIS Summary of this function goes here
%   Detailed explanation goes here

if nargin < 2
    extreme = 0.05;
end

x = sort(v,'descend');
min = x(round(length(x)* (1-extreme)));
max = x(round(length(x)* extreme));
caxis([min max])

end

