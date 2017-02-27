function [yesno, which_yes, which_no] = belongsToSet (points, test_set, mu, bar)

%% Set up waitbar
if nargin < 4
    bar = 1;
end
  
if bar
  disp(['belongsToSet: Testing ', num2str(size(points,1)), ' points if they belong to a set with ', num2str(size(test_set, 1)), ' elements.' ])%, ]);
  h = waitbar(0, 'Checking if points belongs to set.');
  total = size(points,1) * size(test_set,1);
  counter_for_waitbar = 0;
end
  
%% Set up parameters
  which_yes = [0 0 0];
  which_no = [0 0 0];
  yesno = zeros(size(points, 1), 1);

%% Run algorithm
  for i = 1 : size(points)
    minimum_distance = 1000;
    for j = 1 : size(test_set)
        if bar
            counter_for_waitbar = counter_for_waitbar + 1;
            if counter_for_waitbar > 5000
                cur = j + (size(test_set, 1) - 1) * i;
                waitbar(cur/total);
                counter_for_waitbar = 0;
            end
        end

      if norm(points(i, :) - test_set(j, :)) < minimum_distance
        minimum_distance = norm(points(i, :) - test_set(j, :));
      end
      if minimum_distance < mu
        which_yes = [which_yes; points(i, :)];
        yesno(i) = 1;
        break
      end
    end
    if (yesno(i) == 0)
        which_no = [which_no; points(i, :)];
    end
  end
  which_yes = which_yes(2:end, :);
  which_no = which_no(2:end, :);
  if bar
       close(h)
  end
 
end