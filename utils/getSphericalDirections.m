function p = getSphericalDirections(r, del, daz)
    p = [0 0 0];
    j = 1;
    for el = del:del:pi - del
      for az = 0:daz:2*pi - daz
        px = r * sin(el)*cos(az);
        py = r * sin(el)*sin(az);
        pz = r * cos(el);
        p(j, :) = [px py pz];
        j = j + 1;
      end
    end
    
    % Add singular points
    p(end+1, :) = [0, 0, r];
    p(end+1, :) = [0, 0, -r];
end