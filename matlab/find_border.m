function [ border ] = find_border( verts, faces )
%FIND_BORDER Summary of this function goes here
%   Detailed explanation goes here

nverts = size(verts,1);
edges = sparse(faces, faces(:,[2 3 1]),1, nverts, nverts);
edges = edges + edges';

[border,~] = find(edges == 1);
border = unique(border);


end

