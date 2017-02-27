function directions = getFeasibleApproachingDirections(this, spherical, dx, threshold, bar)


%% Set up waitbar
if nargin < 3
      bar = 1;
end
  
if bar
  disp(['belongsToSet: Testing ', num2str(size(this.nonconvex_cloud,1)), ...
      ' points if they belong to a set with ', num2str(size(spherical, 1)), ' elements' ])%, ]);
  h = waitbar(0, 'Checking if points belongs to set.');
  total = size(this.nonconvex_cloud,1) * size(spherical,1);
  counter_for_waitbar = 0;
end


%% Run Algorithm
spherical_directions = getSphericalDirections(spherical(1), ...
                                              spherical(2), ...
                                              spherical(3));
          
feasible_directions = [0 0 0 0 0 0];                                          
for point = 1:size(this.nonconvex_cloud, 1)  % for each non convex point
    for direction = 1:size(spherical_directions, 1)  % for each spherical direction
        
        
        if bar
            counter_for_waitbar = counter_for_waitbar + 1;
            if counter_for_waitbar > 1
                cur = point + (size(this.nonconvex_cloud, 1) - 1) * direction;
                waitbar(cur/total);
                counter_for_waitbar = 0;
            end
        end
        
        
        %disp(['Working on ', num2str(point + (direction - 1)*size(this.nonconvex_cloud, 1)), ' of ', num2str(size(spherical_directions, 1)*size(this.nonconvex_cloud, 1))]);
        
        % Calculate the spherical directions points for the current non convex point
        p3 = spherical_directions(direction, :) + this.nonconvex_cloud(point, :);
        %scatter3(p3(1, 1),p3(1, 2),p3(1, 3), 's');
        %scatter3(this.nonconvex_cloud(point, 1), this.nonconvex_cloud(point, 2),this.nonconvex_cloud(point, 3), 's');
        

            % Calculate the line segment btn the non convex point and the spherical directions point
            line_seg = getLineSegment(this.nonconvex_cloud(point, :), p3, dx);
            %scatter3(line_seg(:, 1), line_seg(:, 2),line_seg(:, 3), 's');
            
            % Check if at least one point of the line segments belongs to the union
            % If this is the case then the direction is not feasible
            [a, b, c] = belongsToSet(line_seg, this.union, threshold, 0);
            if isempty(b)
                feasible_direction = [p3, this.nonconvex_cloud(point, :)];
                
                feasible_directions = [feasible_directions; feasible_direction];
                disp(['Found feasible direction.']);
            end
    end
end

% directions = [0 0 0];
% for i = 1 : size(feasible_directions, 1)
%     if feasible_directions(i, 1) == 1
%         directions = [directions; spherical_directions(i, :)];
%     end
% end
directions = feasible_directions(2:end, :);

if bar
    close(h)
end
                                   
% for p = 1:size(this.nonconvex_cloud, 1)
%     nonconvex_point =  repmat(this.nonconvex_cloud(p, :), size(spherical_directions, 1), 1);
%     p3 = spherical_directions + nonconvex_point;    
% %     hold on
% %     %quiver3(zeros(size(nonconvex_point, 1), 3),zeros(size(nonconvex_point, 1), 3),zeros(size(nonconvex_point, 1), 3), p3(:,1), p3(:,2), p3(:,3), 'r', 'LineWidth', 1);
% %     scatter3(p3(:,1), p3(:,2), p3(:,3), '.', 'b');
% 
%     for dir = 1:size(p3, 1)
%         line_seg = getLineSegment(this.nonconvex_cloud(p, :), p3(dir, :), dx);
%         b = belongsToSet(line_seg, this.union, threshold);
%         if isempty(b)
%             scatter3(p1p2(:,1), p1p2(:,2), p1p2(:,3), 'g');
%             approaching_direction = [approaching_direction; nonconvex_points(i, :) - pfinal(j, :)];
%       endif
%     end
% end
% 
% 
% 
% 
% approaching_direction = [0, 0, 0];
% for i = 1:20
%   pfinal = point_final + repmat(nonconvex_points(i, :), size(point_final, 1), 1);
%   scatter3(point_final(:,1), point_final(:,2), point_final(:,3), 'g');
% 
%   for j = 1:size(pfinal)
%     p1p2 = getLineSegment(nonconvex_points(i, :), pfinal(j, :), 10);
%     b = belongsToSet(p1p2, union, 0.02);
%     scatter3(b(:,1), b(:,2), b(:,3), "black");
%     if isempty(b)
%       scatter3(p1p2(:,1), p1p2(:,2), p1p2(:,3), 'g');
%       approaching_direction = [approaching_direction; nonconvex_points(i, :) - pfinal(j, :)];
%     endif
%   endfor
% endfor
% approaching_direction = approaching_direction(2:end, :);
% 
% for i = 1:size(approaching_direction)
% plotVector([0,0,0], approaching_direction(i, :));
% endfor
% 
% end