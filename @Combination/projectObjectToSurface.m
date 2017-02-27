function [projection, union] = projectObjectToSurface(this)
    projection = projectPointToPlain(this.object.point_cloud, this.surface.point, this.surface.normal);
    union = [this.object.point_cloud; projection];
end