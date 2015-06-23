function [ phi,u,h ] = dist_func_direct( verts,faces, gama, m )
%DIST_FUNC_DIRECT Summary of this function goes here
%   Detailed explanation goes here
if nargin < 4
    m = 1;
end

[grad, div, L] = gen_diff_ops(verts,faces);

h = mean_edge(verts,faces);
u = heat_func(verts,faces,m * h^2, gama,L);
phi = dist_func(verts,faces,u,grad,div,L);


end

