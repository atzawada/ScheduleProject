function quickTally(gameArray, officalName)

keepGoing = 1;

while keepGoing
    
    choice = quickTallyMenu();
    
    switch choice
        case 1
            clc;
            disp('You have selected team tally');
            teamData = teamTally(gameArray);
            printTeamTally(teamData);
            pause
        case 2
            clc;
            disp('You have selected partner tally')
            [partnerVec, timesVec] = partnerTally(gameArray, officalName);
            printPartnerTally(partnerVec, timesVec);
            pause
            clear timesVec
        case 3
            disp('You have selected rink tally');
            [rinkVec, timesVec] = rinkTally(gameArray);
            printRinkTally(rinkVec, timesVec);
            pause
            clear timesVec
        case 4
            disp('You have selected level tally');
            [levelVec, timesVec] = levelTally(gameArray);
            printLevelTally(levelVec, timesVec);
            pause
            clear timesVec
        case 5
            return
    end
    
end