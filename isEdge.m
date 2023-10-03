function result = isEdge(image, y, x)
    result = false;
    if (y > 1 && y < size(image, 1))
        if (image(y+1, x) == 0)
            result = true;
        end
        if (image(y-1, x) == 0)
            result = true;
        end
    end
    if (x > 1 && x < size(image, 2))
        if (image(y, x+1) == 0)
            result = true;
        end
        if (image(y, x-1) == 0)
            result = true;
        end
    end
end