% Function to concatenate and return the games league

function [leagueOut] = readLeague(dataIn,i)

i = i+1;

leagueOutLineOne = char(dataIn(i,6));
leagueOutLineTwo = char(dataIn(i+1,6));

% Test to see if league name is one line or two
if ~cellfun('isempty',dataIn(i+1,6))
    leagueOutCell = strcat({leagueOutLineOne},{leagueOutLineTwo});
    leagueOut = char(leagueOutCell);
else
    leagueOut = leagueOutLineOne;
end

end