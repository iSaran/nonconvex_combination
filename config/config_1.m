clear; close all; clc

point_cloud_sample = 25; % to do, in m
belongs_to_set_threshold = 0.01; % in m, what is considered close enough to belong to set
dx = 0.01; % in m, the distance btw points in line segments
spherical = [0.2, pi/2 pi/6];
sample_num_nonconvex_points = 50;
sur_limit = 0.15;

%% Plot configuration
blue = [0 0.4470 0.7410];
red = [0.85 0.325 0.0980];
green = [0.4660    0.6740    0.1880];
orange = [1 0.5 0];

%% Read data for object and surface
object_name = 'plate_dinera';
a = '';
fig_name = strcat(object_name, a);
p0 = [0 0 0];
R0 = [1 0 0
      0 1 0
      0 0 1];
%R0 = doRotX(R0, pi/2);
temp = [R0; [0 0 0]];
object_pose = [temp [p0' ;1]];
surface_normal_vector = [0 0 1];
surface_point = [0 0 -0.02];