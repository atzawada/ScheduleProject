function quickSearch(gameArray)

keepGoing = 1;

while keepGoing
    
    choice = quickSearchMenu();
    
    switch choice
        case 1
            clc;
            disp('You have selected team search');
            team = input('What team do you want to search for: ','s');
            [numHome, numAway, numTotal] = teamSearch(gameArray, team);
            fprintf('You have had %s %i times as a home team, %i times as an away team, %i times total',team, numHome, numAway, numTotal);
            pause
        case 2
            clc;
            disp('You have selected partner search')
            official = input('What official do you want to search for: ','s');
            numTimes = partnerSearch(gameArray, official);
            fprintf('You have had %s as a partner %i times',official,numTimes);
            pause
        case 3
            clc;
            disp('You have selected rink search')
            rink = input('What rink do you want to search for: ','s');
            numTimes = rinkSearch(gameArray, rink);
            fprintf('You have worked at rink %s %i times', rink, numTimes);
            pause
        case 4
            clc;
            disp('You have selected level search')
            level = input('What level do you want to search for: ','s');
            numTimes = levelSearch(gameArray, level);
            fprintf('You have at level %s %i times', level, numTimes);
            pause
        case 5
            return
    end
    
end