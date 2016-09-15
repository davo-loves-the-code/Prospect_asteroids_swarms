function xy = simulate_one_time_step(agents)
xy(:,1) = agents.xy(:,1) + agents.v .* cos(agents.direction);
xy(:,2) = agents.xy(:,2) + agents.v .*sin(agents.direction);

end