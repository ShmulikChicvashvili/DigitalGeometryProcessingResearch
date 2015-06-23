function [ u ] = heat_func( verts,faces, t, gama, L )
%HEAT_FUNC Summary of this function goes here
%   Detailed explanation goes here

if nargin < 5
    [~,~,L] = gen_diff_ops(verts, faces);
end
L = -L;

u0 = zeros(size(verts,1),1);
u0(gama) = 1;

u = (speye(size(L))-t*L) \ u0;

end

