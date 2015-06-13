function [  ] = visualize_v_field( verts,faces,v,resize )
%VISUALIZE_V_FIELD Summary of this function goes here
%   Detailed explanation goes here

hold on
if nargin < 4
    resize = 1;
end

n = size(v,1) / 3;

if n == size(faces,1)
    centers = zeros(size(faces,1),3);
    for i = 1:3
        centers = centers + verts(faces(:,i),:);
    end
    centers = centers / 3;
    X = centers(:,1);
    Y = centers(:,2);
    Z = centers(:,3);
else
    X = verts(:,1);
    Y = verts(:,2);
    Z = verts(:,3);
end



quiver3(X,Y,Z,...
    v(1:n),v(n+1:2*n),v(2*n+1:3*n),resize);

hold off

end

