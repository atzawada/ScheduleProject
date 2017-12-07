function [numHome, numAway, numTimes] = teamSearch(gameArray, team)

numHome = 0;
numAway = 0;
numTimes = 0;

numGames = length(gameArray);

for i = 1:numGames
    
    homeTeam = gameArray(i).home;
    awayTeam = gameArray(i).away;
    
    if strcmp(team, homeTeam)
        numHome = numHome + 1;
    end
    
    if strcmp(team, awayTeam)
        numAway = numAway + 1;
    end
    
end

numTimes = numHome + numAway;

end