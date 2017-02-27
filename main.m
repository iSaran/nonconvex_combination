%clear; close all; clc

%addpath('utils')

%% Set Parameters
%config
figure


 
 %% Load object, surface and object-surface combination
disp(['Main: Loading object.']);
target_object = TargetObject(object_name, object_pose,  point_cloud_sample);
target_object.plot(sur_limit/2)

disp(['Main: Loading support surface.']);
support_surface = SupportSurface(surface_normal_vector, surface_point);
hold on
support_surface.plot(sur_limit)
axis equal
print(strcat('../../fig/matlab_', fig_name, '_1'),'-depsc');

disp(['Main: Projecting target object to support surface']);
combination = Combination(target_object, support_surface);
[combination.projection, combination.union] = combination.projectObjectToSurface;
figure
scatter3(combination.union(:, 1), ...
         combination.union(:, 2), ...
         combination.union(:, 3), ...
         '.', 'MarkerEdgeColor', blue)

axis equal
print(strcat('../../fig/matlab_', fig_name, '_2'),'-depsc');

disp(['Main: Calculating non convex points.']);
combination.nonconvex_cloud = combination.getNonConvexPoints(dx, belongs_to_set_threshold);

hold on
scatter3(combination.nonconvex_cloud(:, 1), ...
         combination.nonconvex_cloud(:, 2), ...
         combination.nonconvex_cloud(:, 3), ...
         '.', 'MarkerEdgeColor', red)
axis equal
print(strcat('../../fig/matlab_', fig_name, '_3'),'-depsc');

disp(['Main: Sampling randomly non convex points by keeping ' sample_num_nonconvex_points]);
combination.nonconvex_cloud = randomSample(combination.nonconvex_cloud, sample_num_nonconvex_points);
hold on
scatter3(combination.nonconvex_cloud(:, 1), ...
         combination.nonconvex_cloud(:, 2), ...
         combination.nonconvex_cloud(:, 3), ...
         'MarkerEdgeColor', green, ...
         'LineWidth', 2)


disp(['Main: Calculating the feasible approaching directions.']);
directions = combination.getFeasibleApproachingDirections(spherical, ...
                                         0.1 * dx, ... 
                                         belongs_to_set_threshold, 0);
directions(:,1:3) = projectPointToPlain(directions(:,1:3), ...
                                        support_surface.point, ...
                                        support_surface.normal);
directions(:,4:6) = projectPointToPlain(directions(:,4:6), ...
                                        support_surface.point, ...
                                        support_surface.normal);
hold on
quiver3(directions(:, 1), directions(:, 2), directions(:, 3), ...
        directions(:, 4) - directions(:, 1), ...
        directions(:, 5) - directions(:, 2), ...
        directions(:, 6) - directions(:, 3))
    
axis equal
print(strcat('../../fig/matlab_', fig_name, '_4'),'-depsc');

%hold on
% quiver3(zeros(size(directions,1), 1), ...
%         zeros(size(directions,1), 1), ...
%         zeros(size(directions,1), 1), ...
%         directions(:,1), ...
%         directions(:,2), ...
%         directions(:,3), 'r', 'LineWidth', 1);
