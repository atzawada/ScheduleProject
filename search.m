classdef search
%SEARCH Library of functions to search game data
%
%   See quickSearch, partnerSearch, levelSearch, teamSearch, rinkSearch

methods (Static)
    
    function quickSearch(gameArray)
    % QUICKSEARCH  brings up menu to allow the user to interact with search
    % tools
    %
    %   quickSearch(gameArray) brings up menu to select a search option
    %
    %   See also partnerSearch, levelSearch, rinkSearch, teamSearch

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
    end
        
    function numTimes = partnerSearch(gameArray, official)

        numTimes = 0;

        numGames = length(gameArray);

        for i = 1:numGames

            numOfficials = length(gameArray(i).officials);

            for j = 1:numOfficials

                nameTest = gameArray(i).officials(j).name;

                if strcmp(nameTest,official)
                    numTimes = numTimes + 1;
                end
            end

        end

    end
        
    function numTimes = levelSearch(gameArray, level)

        numTimes = 0;

        numGames = length(gameArray);

        for i = 1:numGames

            if strcmp(gameArray(i).league, level)
                numTimes = numTimes + 1;
            end

        end

    end

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
    
    function numTimes = rinkSearch(gameArray, rink)

        numTimes = 0;

        numGames = length(gameArray);

        for i = 1:numGames

            if strcmp(gameArray(i).site, rink)
                numTimes = numTimes + 1;
            end

        end

    end
    
end

end