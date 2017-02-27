function plot(this, scale)
    addpath('data/')
    scatter3(this.point_cloud(:,1), this.point_cloud(:,2), this.point_cloud(:,3), '.')
    hold on
    plotFrame(this.pose, scale)
end