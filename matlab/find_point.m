function [ index ] = find_point( v,point )
%FIND_POINT Summary of this function goes here
%   Detailed explanation goes here

[~,index] = min(norm_row(v-repmat(point,...
                                size(v,1),...
                                1)));

end

