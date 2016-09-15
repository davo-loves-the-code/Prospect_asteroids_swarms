function [velocities, direction, forces, force_directions] = update_velocity(agents, map, SCALE, ORIGIN)
%     % Swarm centre of gravity
%     centroid = [mean(agents.xy(:,1)), mean(agents.xy(:,2))];
%     % Distance from centroid
%     distances = sqrt((centroid(1) - agents.xy(:,1)).^2 + (centroid(2) - agents.xy(:,2)).^2);
%     
%     %Is distance greater than 5 metres? (arbitrary)
%     %repel = distances > 5;
%     %attract = ~repel;
%     %attract_repel = attract - repel; %vector of +1's for attraction, -1's for repulsion
%     forces = (distances - 5);
%     %direction to centre of gravity
%     force_directions = atan2(centroid(2) - agents.xy(:,2), centroid(1) - agents.xy(:,1));
%     %convert to cartesian, add forces to velocities
%     [fx,fy] = pol2cart(force_directions, forces);
%     [vx, vy] = pol2cart(agents.direction, agents.v);
%     vx = vx + 0.2*fx; vy = vy + 0.2*fy;
%     %convert back to polar coordinates
%     [direction, velocities] = cart2pol(vx, vy);
    
    
    % CONTOUR FOLLOWING
    % Generate contour map (binary)
    contour_map = get_contour_map(map(:,:,1));
    % Find the closest '1' element to each agent
    [D, IDX] = bwdist(contour_map);
    %   D: distance to nearest nonzero element
    %   IDX: Linear index of nearest nonzero element
    
    agents_x_grid = floor(agents.xy(:,1)*SCALE + ORIGIN(1) + 1);
    agents_y_grid = floor(ORIGIN(2) - agents.xy(:,2)*SCALE + 1);
    agents_xy_grid_linear = sub2ind(size(D), agents_y_grid, agents_x_grid);
    
    % Generate closest (real distance) point to each agent
    % Two vectors: X dist and Y dist
    targets_linear_index = IDX(agents_xy_grid_linear);
    [target_row, target_col] = ind2sub(size(IDX), targets_linear_index);
    x_dist = cast((target_col - agents_x_grid)/SCALE, 'double');
    y_dist = cast((agents_y_grid - target_row)/SCALE, 'double'); 
    % Generate distances and trajectories
    distances = D(agents_xy_grid_linear);
    trajectories = atan2(y_dist, x_dist);
    % Direct each agent towards it's closest contourmap element
    if any(distances == Inf) 
       direction = rand(10,1); % * 3.14 
    else
        direction = trajectories;
    end
    velocities = 0.3*ones(10,1);
    
    forces = zeros(size(velocities));
    force_directions = zeros(size(velocities));
    
    
    
    
    
end