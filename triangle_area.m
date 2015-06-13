function [ area ] = triangle_area( verts,faces )
%TRIANGLE_ARRAY Summary of this function goes here
%   Detailed explanation goes here

t=1:size(faces,1);
t=t';
v1 = verts(faces(t,1),:);
v2 = verts(faces(t,2),:);
v3 = verts(faces(t,3),:);
area = cross(v2-v1,v3-v2,2);

area = sqrt(sum((area.^2),2))/2;

end

