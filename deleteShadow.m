function pixelArray = deleteShadow(image, shadowDelete)
    for s = 1:(shadowDelete+1)
        newImage = image;
        for y = 1:size(image, 1)
            for x = 1:size(image, 2)
                if (image(y, x) == 255)
                    if s ~= shadowDelete+1
                        if (isEdge(image, y, x) == true)
                            newImage(y, x) = 0;
                        end
                    else
                        if (isEdge(image, y, x) == false)
                            newImage(y, x) = 0;
                        end
                    end
                end
            end
        end
        image = newImage;
        pixelArray = newImage;
    end
end