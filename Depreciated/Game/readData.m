function [allGames] = readData(dataInTxt,dataInNum,officialName)
% READDATA  Read in game data from an excel spreadsheet
%
%   allGames = readData(dataInText, dataInNum, officialName) reads in game 
%   data from raw excel data into allGames
%
%   See also readLeague, readOfficial, readSchedule, readSite

% Initialization of stepper variables
j=1;
k=1;

% loop to run through the text data
for i = 1:length(dataInTxt)
    
    % Cell contents to test for a date
    dateTest = char(dataInTxt(i,3));
    
    % Statement to test if cell contents is appropriate length for a date
    if length(dateTest) <= 10 && length(dateTest) >= 8
        
        % Initialize latest game as a game struct
        allGames(k) = game;
        
        % Read in the time and remove day of week abbreviation
        timeRaw = char(dataInTxt(i+1,3));
        time = timeRaw(6:end);
        
        % Concatenates time and date and coverts to numerical format
        dateNum = datenum(strcat(dateTest,time));
        dateAndTime = dateNum;
        
        % Get day of week abbreviation from raw time string
        dayOfWeek = timeRaw(2:4);
        
        % Read in game site
        site = readSite(dataInTxt,i);
        
        % Store to main array values for Date/Time, Day of Week, Home Team,
        % Visiting Team, Site, Level, and League
        allGames(k).dateTime = dateAndTime;
        allGames(k).dayOfWeek = dayOfWeek;
        allGames(k).home = char(dataInTxt(i,13));
        allGames(k).away = char(dataInTxt(i,18));
        allGames(k).site = site;
        allGames(k).level = char(dataInTxt(i,6));
        allGames(k).league = readLeague(dataInTxt,i); 
        
        % Initialize variables for next step
        l = i;
        m = 1;
        keepGoing = 1;
        hitNames = 0;
        
        % Method to read in officials
        while keepGoing
            
            l=l+1;
            
            nameTest = dataInTxt(l,4);
            
            if cellfun('isempty',nameTest) && ~hitNames
                continue
            end
            
            if ~cellfun('isempty',nameTest) && hitNames
                officialList(m) = readOfficial(dataInTxt,dataInNum,l);
                m = m+1;
            end
            
            if ~cellfun('isempty',nameTest) && ~hitNames
                officialList(m) = readOfficial(dataInTxt,dataInNum,l);
                m = m+1;
                hitNames = 1;
            end
            
            if cellfun('isempty',nameTest) && hitNames
                break
            end
            
            if strcmp(nameTest, officialName)
                allGames(k).fee = dataInNum(l-11,19);
            end
            
        end
        
        allGames(k).officials = officialList;
        
        clearvars officialList
        
        k = k+1;
    end
    
end