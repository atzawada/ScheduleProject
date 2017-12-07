function printLevelTally(levelVec, timesVec)

numLevels = length(levelVec);

for i = 1:numLevels
    
    levelData(i).name = levelVec(i);
    levelData(i).times = timesVec(i);
    
end

levelSwitch = freq.empty;
numSwitches = 1;

while numSwitches > 0
    
    numSwitches = 0;

    for i = 1:numLevels-1

        levelFirst = levelData(i);
        levelSecond = levelData(i+1);

        if levelFirst.times < levelSecond.times

            levelSwitch = levelFirst;
            levelFirst = levelSecond;
            levelSecond = levelSwitch;

            levelData(i) = levelFirst;
            levelData(i+1) = levelSecond;

            numSwitches = numSwitches + 1;

        end
    end
end

struct2table(levelData)

end