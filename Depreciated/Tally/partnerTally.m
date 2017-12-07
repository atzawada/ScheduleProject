function [partnerVec,timesVec] = partnerTally(gameArray, officialName)

numGames = length(gameArray);
partnerVec = string.empty;

for i = 1:numGames
    
    numOfficials = length(gameArray(i).officials);
    
    for j = 1:numOfficials
        
        testName = gameArray(i).officials(j).name;
        
        if ~strcmp(testName, officialName)
            partnerVec = vectMember(partnerVec, testName);
        end
        
    end
    
end

partnerVecLength = length(partnerVec);

for k = 1:partnerVecLength
    
    timesVec(k) = partnerSearch(gameArray,partnerVec(k));
    
end

end