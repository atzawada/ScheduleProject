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