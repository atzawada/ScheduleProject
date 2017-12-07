function numTimes = levelSearch(gameArray, level)

numTimes = 0;

numGames = length(gameArray);

for i = 1:numGames
    
    if strcmp(gameArray(i).league, level)
        numTimes = numTimes + 1;
    end

end

end