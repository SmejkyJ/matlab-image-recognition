function center = findCenter(image)
    xMin = 64;
    xMax = 0;
    yMin = 64;
    yMax = 0;
    for y = 1:size(image, 1)
        for x = 1:size(image, 2)
            if (image(y,x) == 255)
                if (yMin > y)
                    yMin = y;
                end
                if (xMin > x)
                    xMin = x;
                end
                if (yMax < y)
                    yMax = y;
                end
                if (xMax < x)
                    xMax = x;
                end
            end
        end
    end
    center = struct('x', 0, 'y', 0, 'r', 0);
    center.x = round((xMax-xMin)/2+xMin);
    center.y = round((yMax-yMin)/2+yMin);
    center.r = round(((xMax-xMin)+(yMax-yMin))/4);
    disp("X: "+center.x+", Y: "+center.y+", r: "+center.r);
end

