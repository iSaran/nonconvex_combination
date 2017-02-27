function plotFrame(homog_transf, scale)
  hold on;
  p = homog_transf(1:3, 4);
  R = homog_transf(1:3, 1:3);
  quiver3(p(1), p(2), p(3), scale*R(1,1), scale*R(2,1), scale*R(3,1), 'r', 'LineWidth', 4);
  quiver3(p(1), p(2), p(3), scale*R(1,2), scale*R(2,2), scale*R(3,2), 'g', 'LineWidth', 4);
  quiver3(p(1), p(2), p(3), scale*R(1,3), scale*R(2,3), scale*R(3,3), 'b', 'LineWidth', 4);
  hold off;
end