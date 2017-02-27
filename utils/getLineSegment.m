function p3 = getLineSegment (p1, p2, dx)
  p1p2_distance = sqrt(sum((p2 - p1).^2, 2));
  number_points = round(p1p2_distance./dx);
  dlambda = 1./(number_points + 1);
  p3 = zeros(sum(number_points), size(p1, 2));
  j = 1;
  for i = 1 : size(dlambda, 1)
      for lambda = dlambda(i):dlambda(i):(1-dlambda(i))
        p3(j, :) =  (1 - lambda) * p1(i, :) +  lambda * p2(i, :);
        j = j + 1;
      end
  end
end
