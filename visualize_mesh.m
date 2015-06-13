function [ ] = visualize_mesh( verts,faces )
%VISUALIZE_MESH Summary of this function goes here
%   Detailed explanation goes here

fv.Vertices = verts;
fv.Faces = faces;
patch(fv);

end

