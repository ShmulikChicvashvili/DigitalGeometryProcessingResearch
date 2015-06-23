function [ phi ] = dist_func( verts,faces,u, grad, div, L )
%DIST_FUNC Summary of this function goes here
%   Detailed explanation goes here

if nargin < 6
    [grad,div,L] = gen_diff_ops(verts,faces);
end
L = -L;

X = -normalize_vectors(grad*u);
phi = L \ (div * X);
phi = phi - min(phi);

end

