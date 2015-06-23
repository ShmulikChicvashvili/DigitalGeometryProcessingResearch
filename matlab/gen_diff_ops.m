function [ grad,div,L ] = gen_diff_ops( verts,faces )
%GEN_DIFF_OPS Summary of this function goes here
%   Detailed explanation goes here

num_v = size(verts,1);
num_f = size(faces,1);

E = compute_e(verts,faces);

% construct the operators

[v_area,f_area] = mesh_areas(verts,faces);
v_area_inv = v_area.^-1;
f_area_inv = f_area.^-1;

%g_v = spdiags(v_area,0,...
%    num_v,num_v);
g_v_inv = spdiags(v_area_inv,0,...
    num_v,num_v);
g_f = spdiags([f_area;f_area;f_area],0,...
    num_f*3,num_f*3);
g_f_inv = spdiags([f_area_inv;f_area_inv;f_area_inv],0,...
    num_f*3,num_f*3);


grad = (1/2) * g_f_inv * E;
div = -g_v_inv * grad' * g_f;
L = (1/4) * g_v_inv * E' * g_f_inv * E;

end

