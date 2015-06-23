function [ h ] = mean_edge( verts,faces )
%MEAN_EDGE Summary of this function goes here
%   Detailed explanation goes here

v1 = verts(faces(:,1),:);
v2 = verts(faces(:,2),:);
v3 = verts(faces(:,3),:);

e1 = v2-v1;
e2 = v3-v2;
e3 = v1-v3;

h = mean2([norm_row(e1), norm_row(e2), norm_row(e3)]);

end

