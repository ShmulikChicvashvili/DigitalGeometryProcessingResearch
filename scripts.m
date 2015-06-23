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

%% mask with boundary
clear;
[v,f,~] = read_off('data/mask.off');
b = find_border(v,f);

b_func = zeros(size(v,1),1);
b_func(b) = 1;

phi = dist_func_direct(v,f,b);

figure;
suptitle('mask');

subplot(1,2,1);
visualize_func(v,f,b_func,[]);
title('border');
axis equal;

subplot(1,2,2);
visualize_func(v,f,phi,[]);
title('phi');
axis equal;
colorbar;

%% hand with boundary
clear;
[v,f,~] = read_off('data/hand.off');
b = find_border(v,f);

b_func = zeros(size(v,1),1);
b_func(b) = 1;

phi = dist_func_direct(v,f,b);

figure;
suptitle('hand');

subplot(1,2,1);
visualize_func(v,f,b_func,[]);
title('border');
axis equal;

subplot(1,2,2);
visualize_func(v,f,phi,[]);
title('phi');
axis equal;
colorbar;

%% hand euclidean  vs geodesic distance
clear;
[v,f,~] = read_off('data/hand.off');

source = [11.45 104.5 28.81];
gama = find_point(v,source);
phi = dist_func_direct(v,f,gama);

euc = norm_row(v - repmat(v(gama,:),size(v,1),1));

figure;
suptitle('Hand - euclidean  vs geodesic distance');

subplot(1,2,1);
visualize_func(v,f,euc,[]);
title('euclidean distance');
axis equal;
colorbar;

subplot(1,2,2);
visualize_func(v,f,phi,[]);
title('geodesic distance');
axis equal;
colorbar;

%% fandisk
clear;
[v,f,~] = read_off('data/fandisk.off');
[grad,div,L] = gen_diff_ops(v,f);


source = [0.7559,0.4337,-0.6774];
gama = find_point(v,source);
[phi,u,~] = dist_func_direct(v,f,gama);

figure;
title('fandisk - phi');
visualize_func(v,f,phi,[]);
axis equal
colorbar;

figure;
title('fandisk - grad(phi)');
% visualize_func(v,f,phi,[]);
visualize_mesh(v,f);
visualize_v_field(v,f,grad * phi);
axis equal;


