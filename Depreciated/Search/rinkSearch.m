function numTimes = rinkSearch(gameArray, rink)

numTimes = 0;

numGames = length(gameArray);

for i = 1:numGames
    
    if strcmp(gameArray(i).site, rink)
        numTimes = numTimes + 1;
    end

end

end