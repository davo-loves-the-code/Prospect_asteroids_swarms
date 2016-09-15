% Updates the history of where agents have been in the past
function map = footprints(map, agentsxy, ~, SCALE, ORIGIN)
% convert agents position to grid coordinates
agents_x_grid = floor(agentsxy(:,1)*SCALE + ORIGIN(1) + 1);
agents_y_grid = floor(ORIGIN(2) - agentsxy(:,2)*SCALE + 1);

agents_linear_index = sub2ind(size(map), agents_y_grid, agents_x_grid);

map(agents_linear_index) = map(agents_linear_index) + 1;

end