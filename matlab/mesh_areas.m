function [ v_area,f_area ] = mesh_areas( verts,faces )
%MESH_AREAS Summary of this function goes here
%   Detailed explanation goes here

f_area = triangle_area(verts,faces);
v_area = vertex_area(verts,faces,f_area);

end

