function readScheduleMileage(gameArray)

for i = 1:length(gameArray)

    for j = 1:length(gameArray(i).officials)

        if strcmp(gameArray(i).officials(j).name,'Andy Zawada')
            disp(gameArray(i).officials(j).mileage);
        end

    end

end

end