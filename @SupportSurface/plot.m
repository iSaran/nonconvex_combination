function plot(this, limit)
  dlimit = 2*limit/4;
  % A plane is a * x + b * y + c * z + d = 0
  % [a,b,c] is the normal. Thus, we have to calculate
  % d and we're set
  d = - this.point * this.normal'; % dot product for less typing
  
  % Create x,y
  [xx, yy] = meshgrid(-limit:dlimit:limit, -limit:dlimit:limit);
% 
%   %# calculate corresponding z
  z = (- this.normal(1)*xx - this.normal(2)*yy - d)/this.normal(3);
%   
%   %# plot the surface
   surf(xx,yy,z)
end