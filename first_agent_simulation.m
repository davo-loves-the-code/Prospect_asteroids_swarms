% Agent based simulation of terrain search
% Alex Davidson


% Create agents (struct of arrays)

agents.name = 1:10;
agents.xy = 50*rand(10,2);
agents.v = zeros(10,1);
agents.direction = zeros(10,1);
agents.fitness = zeros(10,1);

% Define origin in discrete space
ORIGIN = [100, 100];

% Define scale
SCALE = 1;  % (1 metre squared = 1 pixel)
SIZE = 200; % square size of discretised map

% Create discrete map
map = zeros(SIZE, SIZE, 2);
%(:,:,1)values correspond to how many times visited
%(:,:,2)values correspond to level of interest
map(:,:,2) = 10*randn(size(map(:,:,2))) - 30;
map(:,:,2) = ~(map(:,:,2) < 0) .* map(:,:,2); %(no negative values)
kern = [0.5, 0.5, 0.5; 0.5, 1, 0.5; 0.5, 0.5, 0.5];
for i=1:40
map(:,:,2) = conv2( map(:,:,2), kern, 'same');
end
kernl = [0.5, 0.5, 0.5, 0.5; 0.5, 1, 1, 0.5; 0.5, 0.5, 0.5, 0.5];
for i=1:floor(40*randn())
map(:,:,2) = conv2( map(:,:,2), kernl, 'same');
end
kernw = [0.5, 0.5, 0.5; 0.5, 1, 0.5; 0.5, 1, 0.5; 0.5, 0.5, 0.5];
for i=1:floor(40*randn())
map(:,:,2) = conv2( map(:,:,2), kernw, 'same');
end


% Generate plotting windows
figure(2);
hterrain = imagesc(map(:,:,2));

figure(1);
hmap = imagesc(map(:,:,1)); hold on;
hswarm = plot((agents.xy(:,1)*SCALE + ORIGIN(1) + 1),...
    (-1*agents.xy(:,2)*SCALE + ORIGIN(2) + 1), '+r', 'markersize', 5);
hvel = quiver((agents.xy(:,1)*SCALE + ORIGIN(1) + 1),...
    (-1*agents.xy(:,2)*SCALE + ORIGIN(2) + 1),...
    10*(agents.v.*cos(agents.direction)), 10*agents.v.*-sin(agents.direction),...
    'white', 'linewidth', 2, 'AutoScale', 'off');
hold off;

for i=1:30000
% Assess fitness
%agents(:).fitness = fitness_eval(agents, map);

% Evolve & mutate
%nothing for now

% Make decision for next time step
[agents.v, agents.direction, forces, force_dir] = update_velocity(agents, map, SCALE, ORIGIN);

% Simulate
agents.xy = simulate_one_time_step(agents);

% Update map (footprints)
map(:,:,1) = footprints(map(:,:,1), agents.xy, SIZE, SCALE, ORIGIN);
% Update visualisations
set(hswarm, 'xdata', agents.xy(:,1)*SCALE + ORIGIN(1) + 1,...
    'ydata', -1*agents.xy(:,2)*SCALE + ORIGIN(2) + 1);
set(hvel, 'xdata', (agents.xy(:,1)*SCALE + ORIGIN(1) + 1),...
    'ydata', (-1*agents.xy(:,2)*SCALE + ORIGIN(2) + 1),...
    'udata', 5.*agents.v.*cos(agents.direction), 'vdata', 5.*agents.v.*-sin(agents.direction));
    %'udata', 5.*forces.*cos(force_dir), 'vdata', 5.*forces.*-sin(force_dir));
set(hmap, 'cdata', map(:,:,1));
%waitforbuttonpress();
pause(0.01);

end
