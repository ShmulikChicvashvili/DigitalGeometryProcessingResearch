function [ mean_error, max_error ] = sphere_t_error( v,f, m, gama )
%SPHERE_T_ERROR Summary of this function goes here
%   Detailed explanation goes here

if nargin < 3
    gama = 1;
end

h = mean_edge(v,f);

points = reshape(v(gama,:),1,[]);
points = repmat(points,size(v,1),1);
points = reshape(points,[],3);
true_dist = dot(repmat(v,size(gama,2),1),points,2);
true_dist = acos(true_dist);
true_dist = reshape(true_dist, size(v,1),[]);
true_dist = min(true_dist,[],2);

mean_error = zeros(size(m));
max_error = zeros(size(m));
[grad,div,L] = gen_diff_ops(v,f);

for i = 1:size(m,2)
    t = m(i) * h^2;
    u = heat_func(v,f,t,gama,L);
    phi = dist_func(v,f,u,grad,div,L);
    
    if any(isnan(phi(:)))
        mean_error(i) = NaN;
        max_error(i) = NaN;
        continue
    end
    
    e = abs(phi-true_dist);
    e = abs(100 * e ./ true_dist); % we take percentage error
    e(isnan(e)) = 0; % fix 0/0 to be error of 0
    
    mean_error(i) = mean(e);
    max_error(i) = max(e);
end

end
