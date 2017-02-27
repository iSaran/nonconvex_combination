function point_proj = projectPointToPlain(point, plain_point, plain_normal)
    uv = null(plain_normal);
    uv = uv * uv';
    point_proj = point * uv - ...
                 repmat(norm(plain_point) * plain_normal, ...
                        [size(point, 1), 1]);
end