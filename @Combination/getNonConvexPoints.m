function nonconvex = getNonConvexPoints(this, dx, set_threshold)
    disp(['Get Non Convex Points. Calculating line segments.']);
    line_seg = getLineSegment(this.object.point_cloud, this.projection, dx);
    disp(['Get Non Convex Points. Calculated ', num2str(size(line_seg, 1)), ' points']);

    disp(['Get Non Convex Points. Checking which segments belongs to the union.']);
    [a, b, nonconvex] = belongsToSet(line_seg, this.union, set_threshold);
    if isempty(nonconvex)
      disp(['Get Non Convex Points. Unable to find non-convex points.']);
    else
      disp(['Get Non Convex Points. Found '  num2str(size(nonconvex), 1) ' non-convex points.']);
    end
end