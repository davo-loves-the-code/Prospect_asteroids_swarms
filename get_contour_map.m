

function cmap = get_contour_map(map)
    lowest = min(map(:));
    minmap = map == lowest;
    notminmap = ~minmap;
    covered_ground = cast(notminmap, 'double');
    
    % Now to find the edges...
    % convolute 
    kern = [1,1,1;1,0,1;1,1,1];
    convmap = conv2(covered_ground, kern, 'same');
    
    % now see the edges, using a nifty trick
    cmap = (convmap .* cast(minmap, 'double')) > 0;
    
    
    
    
    
    
    

end