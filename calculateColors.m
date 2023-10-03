function colors = calculateColors(image)
    colors = struct('color', {}, 'amount', {});
    for y = 1:size(image, 1)
        for x = 1:size(image, 2)
            isColorHere = false;
            for c = 1:numel(colors)
                if (colors(c).color == image(y, x))
                    colors(c).amount = colors(c).amount + 1;
                    isColorHere = true;
                    break;
                end
            end
            if (isColorHere == false)
                newColor = struct('color', image(y, x), 'amount', 1);
                colors(end + 1) = newColor;
            end
        end
    end
end