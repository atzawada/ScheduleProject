function printRinkTally(rinkVec, timesVec)

numRinks = length(rinkVec);

for i = 1:numRinks
    
    rinkData(i).name = rinkVec(i);
    rinkData(i).times = timesVec(i);
    
end

rinkSwitch = freq.empty;
numSwitches = 1;

while numSwitches > 0
    
    numSwitches = 0;

    for i = 1:numRinks-1

        rinkFirst = rinkData(i);
        rinkSecond = rinkData(i+1);

        if rinkFirst.times < rinkSecond.times

            rinkSwitch = rinkFirst;
            rinkFirst = rinkSecond;
            rinkSecond = rinkSwitch;

            rinkData(i) = rinkFirst;
            rinkData(i+1) = rinkSecond;

            numSwitches = numSwitches + 1;

        end
    end
end

struct2table(rinkData)

end