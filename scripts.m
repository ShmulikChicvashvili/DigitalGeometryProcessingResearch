%% generate error vs m graph for spheres
% sphere_t_samples
clear;
%% show bunny distances and gradient
[v,f,~] = read_off('data/bunny2.off');
[grad,div,L] = gen_diff_ops(v,f);

h = mean_edge(v,f);
source = [-0.0723,0.173,-0.0379]; % ear
% source = [-0.09253,0.121,0.04219]; % nose
[~,gama] = min(norm_row(v-repmat(source,...
                                size(v,1),...
                                1)));
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

subplot(2,2,3.5);
visualize_func(v,f,phi,[]);
title('phi');