function [ u ] = heat_func( verts,faces, t, gama )
%HEAT_FUNC Summary of this function goes here
%   Detailed explanation goes here

[~,~,L] = gen_diff_ops(verts, faces);
L = -L;

u0 = zeros(size(verts,1),1);
u0(gama) = 1;

u = (eye(size(L))-t*L) \ u0;

end

