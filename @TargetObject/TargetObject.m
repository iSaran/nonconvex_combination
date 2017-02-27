classdef TargetObject
    properties
        pose
        point_cloud
    end
    methods
        function this = TargetObject(name, object_pose, sampling_rate)
            this.pose = object_pose;
            this.point_cloud = this.getFromFile(name, sampling_rate);
        end
        point_cloud = getFromFile(this, file_name, sampling_rate)
        point_cloud = projectToSurface(this, surface)
        plot(this, scale)
    end
end