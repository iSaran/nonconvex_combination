classdef Combination
    properties
        object
        surface
        projection
        union
        nonconvex_cloud
        approaching_directions
    end
    methods
        function this = Combination(object, surface)
            this.object = object;
            this.surface = surface;
        end
        point_cloud = getFromFile(this, file_name, sampling_rate)
        [projection, union] = projectObjectToSurface(this)
        nonconvex = getNonConvexPoints(this, dx, set_threshold)
        directions = getFeasibleApproachingDirections(this, spherical, dx, threshold, bar)
        plot(this)
    end
end