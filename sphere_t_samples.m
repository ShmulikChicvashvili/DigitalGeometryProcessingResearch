%% show errors for distance of point (0,1,0) for various spheres and m
m = linspace(0.01,5,100);
spheres = {'sphere_s0' 'sphere_s1'...
    'sphere_s2' 'sphere_s3'...
    'sphere_s4'};% 'sphere_s5'};
p = [0 1 0];

mean_error = cell(size(spheres));
max_error = cell(size(spheres));

for i = 1:numel(spheres)
    sphere = spheres{i};
    
    tic()
    [v,f,~] = read_off(strcat('data/',sphere,'.off'));
    [~,gama] = min(norm_row(v-repmat(p,size(v,1),1)));
    [mean_error{i}, max_error{i}] = sphere_t_error(v,f,m,gama);
    toc();
end

% show mean error

figure;
hold all;
for i = 1:numel(mean_error)
    plot(m, mean_error{i});
end

legend(spheres);
ylim([0 inf])
xlim([0 inf])
xlabel('m');
ylabel('mean % error');
title('Mean Error of distance to (0,1,0)');

% show max error
figure;
hold all;
for i = 1:numel(max_error)
    plot(m, max_error{i});
end

legend(spheres);
%ylim([0 inf])
xlim([0 inf])
xlabel('m');
ylabel('max % error');
title('Max Error of distance to (0,1,0)');
