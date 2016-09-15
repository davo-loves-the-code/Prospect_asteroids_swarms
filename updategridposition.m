
function [gridpositionx, gridpositiony] = updategridposition(agents, ORIGIN, SCALE)
    gridpositionx = agents(:).xy(1)*SCALE + ORIGIN(1) + 1;
    gridpositiony = -1*agents(:).xy(2)*scale + ORIGIN(2) + 1;
end