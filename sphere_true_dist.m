function [ true_dist ] = sphere_true_dist(v, gama )
%SPHERE_TRUE_DIST calculate geodesic distances with 'gama' as sources
%   Detailed explanation goes here

points = reshape(v(gama,:),1,[]);
points = repmat(points,size(v,1),1);
points = reshape(points,[],3);
true_dist = dot(repmat(v,size(gama,2),1),points,2);
true_dist = acos(true_dist);
true_dist = reshape(true_dist, size(v,1),[]);
true_dist = min(true_dist,[],2);

end

