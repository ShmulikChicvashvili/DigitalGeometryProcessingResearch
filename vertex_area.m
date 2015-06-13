function [ area ] = vertex_area( verts,faces,face_area )
%VERTEX_AREA Summary of this function goes here
%   Detailed explanation goes here

t=1:size(faces,1);
t=t';
%A=zeros(size(verts,1),size(faces,1));
%A(sub2ind(size(A),faces,[t t t]))=1/3;

A=sparse(faces,[t t t], 1/3 ,size(verts,1),size(faces,1));
A=spfun(@(x) 1/3,A);

area = A * face_area;
end