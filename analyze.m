function result = analyze(image, center, analyzeClearence, sections)
    result = false;
    allResults = struct('correct', 0, 'wrong', 0);
    newImage = image;
    for deg = 0:(sections-1)
        multipliers = struct( ...
            'x', sin((2*pi/sections)*deg), ...
            'y', cos((2*pi/sections)*deg) ...
        );
        found = false;
        for c = -analyzeClearence:analyzeClearence
            check = struct( ...
                'x', round(center.x+((center.r+c)*multipliers.x)), ...
                'y', round(center.y+((center.r+c)*multipliers.y)) ...
            );
            if (check.y > 63)
                check.y = 63;
            end
            if (check.x > 62)
                check.x = 62;
            end
            if (check.y < 1)
                check.y = 1;
            end
            if (check.x < 1)
                check.x = 1;
            end
            if (image(check.y, check.x) == 255)
                found = true;
                newImage(check.y, check.x) = 120;
            else 
                newImage(check.y, check.x) = 60;
            end
            if (image(check.y, check.x+1) == 255)
                found = true;
                newImage(check.y, check.x+1) = 120;
            else 
                newImage(check.y, check.x+1) = 60;
            end
        end
        if (found == true)
            allResults.correct = allResults.correct + 1;
        else 
            allResults.wrong = allResults.wrong + 1;
        end
    end
    if (allResults.correct >= sections*0.95)
        result = 'k';
    else
        result = 'c';
    end
end

