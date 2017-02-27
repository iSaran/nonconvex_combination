clc; clear; close

data = [0 0 0; 1 1 1; 2 2 2; 3 3 3; 4 4 4; 5 5 5; 6 6 6; 0 0 0; 1 1 1; 2 2 2; 3 3 3; 4 4 4; 5 5 5; 6 6 6];
datasize = size(data, 1);
n = 3;
out = zeros(n, size(data, 2));

index = randsample(datasize, n);

for i = 1:n
    out(i, :) = data(index(i), :);
end






% 
% p3 = getSphericalDirections(1, pi/2, pi/6);
% spherical = [1, pi/2 pi/6];
% spherical_directions = getSphericalDirections(spherical(1), ...
%                                               spherical(2), ...
%                                               spherical(3));
% 
% nonconvex_cloud = [0 0 0; 1 1 1; 0 1 2; -1 -1 -1 ];
% 
% 
% 
% 
% 
% 
% %quiver3(zeros(size(p3,1), 1), zeros(size(p3,1), 1), zeros(size(p3,1), 1), p3(:,1), p3(:,2), p3(:,3), 'r', 'LineWidth', 1);
% 
% % dx = 0.01;
% % p1 = [0 0 0; 1 1 1; 2 2 2; 3 3 3];
% % p2 = [0 0 2; 4 6 7; 8 9 10; 3 3 3];
% % 
% % p3 = getLineSegment (p1, p2, dx)
% % 
% % scatter3(p1(:,1), p1(:,2), p1(:,3), 'b');
% % hold on
% % scatter3(p2(:,1), p2(:,2), p2(:,3), 'r');
% hold on
% scatter3(p3(:,1), p3(:,2), p3(:,3), 'g');