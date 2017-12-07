function [teamData] = teamTally(gameArray)

numGames = length(gameArray);

teamVec = string.empty;

for i = 1:numGames

    homeTeam = gameArray(i).home;
    awayTeam = gameArray(i).away;
    
    teamVec = vectMember(teamVec,homeTeam);
    teamVec = vectMember(teamVec,awayTeam);

end

numTeams = length(teamVec);

for i = 1:numTeams
    
    [numHome, numAway, numTotal] = teamSearch(gameArray,teamVec(i));
    
    teamData(i).name = teamVec(i);
    teamData(i).timesHome = numHome;
    teamData(i).timesAway = numAway;
    teamData(i).timesTotal = numTotal;

end

end