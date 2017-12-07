function [levelVec, timesVec] = levelTally(gameArray)

numGames = length(gameArray);
levelVec = string.empty;

for i = 1:numGames
    
    levelVec = vectMember(levelVec, gameArray(i).league);
    
end

levelVecLength = length(levelVec);

for k = 1:levelVecLength
    
    timesVec(k) = levelSearch(gameArray,levelVec(k));
    
end


end