%% generate error vs m graph for spheres
clear;
% sphere_t_samples
%% show bunny distances and gradient
clear;
[v,f,~] = read_off('data/bunny2.off');
[grad,div,L] = gen_diff_ops(v,f);


source = [-0.0723,0.173,-0.0379]; % ear
% source = [-0.09253,0.121,0.04219]; % nose
gama = find_point(v,source);
h = mean_edge(v,f);
u = heat_func(v,f,h^2,gama);
phi = dist_func(v,f,u);

figure;
suptitle('Bunny2.off');

subplot(2,2,1);
visualize_mesh(v,f);
visualize_v_field(v,f,-normalize_vectors(grad * u));
title('-grad(u)/|grad(u)|');

subplot(2,2,2);
visualize_func(v,f,phi,[]);
visualize_v_field(v,f,grad * phi);
title('phi and grad(phi)');
colorbar;

subplot(2,2,3.5);
visualize_func(v,f,phi,[]);
title('phi');
colorbar;

%% sphere distance to (0,1,0)
clear;
[v,f,~] = read_off('data/sphere_s2.off');
gama = find_point(v,[0 1 0]);

h = mean_edge(v,f);
u = heat_func(v,f,h^2,gama);
phi = dist_func(v,f,u);
true_dist = sphere_true_dist(v,gama);

e = abs(100 * (phi-true_dist) ./ true_dist); % we take percentage error
e(isnan(e)) = 0; % fix 0/0 to be error of 0

figure;
suptitle('sphere\_s2 distance to (0,1,0)');

subplot(2,2,1);
visualize_func(v,f,true_dist,[]);
title('real distance');
axis equal;
colorbar;

subplot(2,2,2);
visualize_func(v,f,phi,[]);
title('phi');
axis equal;
colorbar;

subplot(2,2,3.5);
visualize_func(v,f,e,[]);
title('error (5% extreme values were dropped)');
adjust_caxis(e,0.05);
axis equal;
colorbar;

%% sphere distance to (0,1,0) or (0,-1,0)
clear;
[v,f,~] = read_off('data/sphere_s2.off');
gama(1) = find_point(v,[0 1 0]);
gama(2) = find_point(v,[0 -1 0]);

h = mean_edge(v,f);
u = heat_func(v,f,h^2,gama);
phi = dist_func(v,f,u);
true_dist = sphere_true_dist(v,gama);

e = abs(100 * (phi-true_dist) ./ true_dist); % we take percentage error
e(isnan(e)) = 0; % fix 0/0 to be error of 0

figure;
suptitle('sphere\_s2 distance to (0,1,0) and (0,-1,0)');

subplot(2,2,1);
visualize_func(v,f,true_dist,[]);
title('real distance');
axis equal;
colorbar;

subplot(2,2,2);
visualize_func(v,f,phi,[]);
title('phi');
axis equal;
colorbar;

subplot(2,2,3.5);
visualize_func(v,f,e,[]);
title('error (5% extreme values were dropped)');
adjust_caxis(e,0.05);
axis equal;
colorbar;