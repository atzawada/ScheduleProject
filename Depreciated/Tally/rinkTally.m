function [rinkVec, timesVec] = rinkTally(gameArray)

numGames = length(gameArray);
rinkVec = string.empty;

for i = 1:numGames
    
    rinkVec = vectMember(rinkVec, gameArray(i).site);
    
end

rinkVecLength = length(rinkVec);

for k = 1:rinkVecLength
    
    timesVec(k) = rinkSearch(gameArray,rinkVec(k));
    
end


end