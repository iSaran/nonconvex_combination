function point_cloud = getFromFile(this, file_name, sampling_rate)
  % Read the point cloud of the object from file
  point_cloud = load(strcat('data/', file_name, '.xyz'));
  
  % Sample point cloud in order to reduce data
  point_cloud = point_cloud(1:sampling_rate:end, :);
  
  % Express point cloud in world coordinates
  point_cloud = point_cloud';
  point_cloud = [point_cloud; ones(1, size(point_cloud, 2))];
  point_cloud = this.pose * point_cloud;
  point_cloud = point_cloud(1:end-1, :)';
end