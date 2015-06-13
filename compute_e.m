function [ E ] = compute_e( verts,faces )
%COMPUTE_E Summary of this function goes here
%   Detailed explanation goes here

num_v = size(verts,1);
num_f = size(faces,1);

% Construct E. j1 holds e_j,i1 for each face 
% (the vector in front of the first vertex for each face).
% similiarly for j2,j3
v1 = verts(faces(:,1),:);
v2 = verts(faces(:,2),:);
v3 = verts(faces(:,3),:);
n = cross(v3-v2,v1-v2);
n = normalize_vectors(n);

j1 = cross(n,v3-v2);
j2 = cross(n,v1-v3);
j3 = cross(n,v2-v1);

t = 1:3*num_f;
t=t';
E = sparse([t t t],[faces;faces;faces],...
    [j1(:,1),j2(:,1),j3(:,1);...
    j1(:,2),j2(:,2),j3(:,2);...
    j1(:,3),j2(:,3),j3(:,3)],...
    num_f*3,num_v);

end

