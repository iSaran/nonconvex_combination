classdef SupportSurface
    properties
        normal
        point
    end
    methods
        function this = SupportSurface(normal, point)
            this.normal = normal;
            this.point = point;
        end
        plot(this, limit)
    end
end