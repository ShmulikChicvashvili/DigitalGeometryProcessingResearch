function [ n ] = norm_row( v )
%NORM_ROW Summary of this function goes here
%   Detailed explanation goes here

n = sqrt(sum(v.^2,2));

end

