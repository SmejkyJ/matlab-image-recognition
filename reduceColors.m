function pixelArray = reduceColors(image, colors, maxColors)
    saveColors = colors;
    reducedColors = struct('color', {}, 'amount', {});
    maxColorDifference = 0;
    while (numel(reducedColors) > maxColors || numel(reducedColors) == 0)
        maxColorDifference = maxColorDifference + 1;
        reducedColors = struct('color', {}, 'amount', {});
        colors = saveColors;
        while (numel(colors) > 0)
            biggestArea = struct('color', 0, 'amount', 0);
            for c = 1:numel(colors)
                if (colors(c).amount > biggestArea.amount)
                    biggestArea.amount = colors(c).amount;
                    biggestArea.color = colors(c).color;
                end
            end
            filteredColors = struct('color', {}, 'amount', {});
            biggestArea.amount = 0;
            for c = 1:length(colors)
                if (abs(double(colors(c).color)-double(biggestArea.color)) <= maxColorDifference)
                    biggestArea.amount = biggestArea.amount + colors(c).amount;
                else 
                    filteredColors(end + 1) = colors(c);
                end
            end
            reducedColors(end + 1) = biggestArea;
            colors = filteredColors;
        end
    end
    sortedColors = struct('color', {}, 'amount', {});
    while (numel(sortedColors) ~= numel(reducedColors))
        biggestArea = struct('color', 0, 'amount', 0);
        position = 0;
        for c = 1:numel(reducedColors)
            if (reducedColors(c).amount > biggestArea.amount)
                biggestArea.amount = reducedColors(c).amount;
                biggestArea.color = reducedColors(c).color;
                position = c;
            end
        end
        reducedColors(position).amount = 0;
        sortedColors(end + 1) = biggestArea;
    end
    backgroundColor = struct('color', 0, 'amount', 0);
    shapeColor = struct('color', 0, 'amount', 0);
    if (sortedColors(1).color < sortedColors(2).color)
        backgroundColor = sortedColors(2);
        shapeColor = sortedColors(1);
        sortedColors(1) = backgroundColor;
        sortedColors(2) = shapeColor;
    end
    disp("Barva pozadí: "+sortedColors(1).color);
    disp("Barva tvaru: "+sortedColors(2).color);
    newImage = image;
    for y = 1:size(image, 1)
        for x = 1:size(image, 2)
            for c = 1:numel(sortedColors)  
                if (abs(double(image(y, x))-double(sortedColors(c).color)) <= maxColorDifference)
                    image(y, x) = sortedColors(c).color;
                    if (c == 2)
                        newImage(y, x) = 255;
                    else 
                        newImage(y, x) = 0;
                    end
                end
            end
        end
    end
    pixelArray = newImage;
end