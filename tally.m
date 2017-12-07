classdef tally 

    methods (Static)
        
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
            
        function printPartnerTally(partnerVec, timesVec)

            numPartners = length(partnerVec);

            for i = 1:numPartners

                partnerData(i).name = partnerVec(i);
                partnerData(i).times = timesVec(i);

            end

            partnerSwitch = freq.empty;
            numSwitches = 1;

            while numSwitches > 0

                numSwitches = 0;

                for i = 1:numPartners-1

                    partnerFirst = partnerData(i);
                    partnerSecond = partnerData(i+1);

                    if partnerFirst.times < partnerSecond.times

                        partnerSwitch = partnerFirst;
                        partnerFirst = partnerSecond;
                        partnerSecond = partnerSwitch;

                        partnerData(i) = partnerFirst;
                        partnerData(i+1) = partnerSecond;

                        numSwitches = numSwitches + 1;

                    end
                end
            end

            struct2table(partnerData)

        end
            
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
        
        function printTeamTally(teamData)

            numTeams = length(teamData);
            teamSwitch = team.empty;
            numSwitches = 1;

            while numSwitches > 0

                numSwitches = 0;

                for i = 1:numTeams-1;

                    teamFirst = teamData(i);
                    teamSecond = teamData(i+1);

                    if teamFirst.timesTotal < teamSecond.timesTotal

                        teamSwitch = teamFirst;
                        teamFirst = teamSecond;
                        teamSecond = teamSwitch;

                        teamData(i) = teamFirst;
                        teamData(i+1) = teamSecond;

                        numSwitches = numSwitches + 1;

                    end
                end
            end

            struct2table(teamData)

        end    
            
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
        
        end
        
    end

end