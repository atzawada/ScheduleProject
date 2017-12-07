function numTimes = partnerSearch(gameArray, official)

numTimes = 0;

numGames = length(gameArray);

for i = 1:numGames
    
    numOfficials = length(gameArray(i).officials);
    
    for j = 1:numOfficials
        
        nameTest = gameArray(i).officials(j).name;
        
        if strcmp(nameTest,official)
            numTimes = numTimes + 1;
        end
    end

end

end