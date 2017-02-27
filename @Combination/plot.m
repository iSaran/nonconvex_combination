function plot(this)
    addpath('data/')
    scatter3(this.point_cloud(:,1), this.point_cloud(:,2), this.point_cloud(:,3), '.')
    hold on
    plotFrame(this.pose, 0.1)
end