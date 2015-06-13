function [ phi ] = dist_func( verts,faces,u )
%DIST_FUNC Summary of this function goes here
%   Detailed explanation goes here

[grad,div,L] = gen_diff_ops(verts,faces);
L = -L;

X = -normalize_vectors(grad*u);
phi = L \ (div * X);

end

