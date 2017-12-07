classdef game
    
    properties
        dateTime
        dayOfWeek
        site
        home
        away
        level
        league
        officials
        fee
    end
    
    methods
        
    end
    
    methods (Static)
        
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
        end
        
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
        
        function [officialOut] = readOfficial(dataInTxt,dataInNum,i)

            officialOut = official;

            officialOut.position = char(dataInTxt(i,2));
            officialOut.name = char(dataInTxt(i,4));
            officialOut.mileage = dataInNum(i-11,8);
            officialOut.number1 = char(dataInTxt(i,10));
            officialOut.number2 = char(dataInTxt(i,14));

        end
        
        function [dataNum, dataTxt, dataRaw] = readSchedule()

            % Prompt for file to read from
            [filename, pathname] = uigetfile('.xls','Pick a schedule File');

            % Concatenate file and path names to get file location
            fileLocation = strcat(pathname,filename);

            % Read raw data from Excel file
            [dataNum, dataTxt, dataRaw] = xlsread(fileLocation,1,'A:Z');

        end
        
        function readScheduleMileage(gameArray)

            for i = 1:length(gameArray)

                for j = 1:length(gameArray(i).officials)

                    if strcmp(gameArray(i).officials(j).name,'Andy Zawada')
                        disp(gameArray(i).officials(j).mileage);
                    end

                end

            end

        end
        
        function [siteOut] = readSite(dataIn,i)

            siteOutLineOne = char(dataIn(i,9));

            siteOutLineTwo = char(dataIn(i+1,9));

            if ~cellfun('isempty',dataIn(i+1,9))
                siteOutCell = strcat({siteOutLineOne},{siteOutLineTwo});
                siteOut = char(siteOutCell);
            else
                siteOut = siteOutLineOne;
            end

        end
        
        function [gameSchedule] = recallScheduleDates(totalSchedule,varargin)

            % Test for incorrect number of arguments
            if nargin < 2
                disp('Error');
                gameSchedule = 0;
                return
            end

            % Test for two arguments
            if nargin == 2

                % Test for 'all' parameter
                if strcmp(varargin{1},'all')
                    gameSchedule = totalSchedule;
                else
                    disp('Error');
                    gameSchedule = 0;
                    return
                end

            end

            % Test for variable date input arguments
            if nargin == 3

                dateOne = varargin{2};
                dateTwo = varargin{3};

                % Set dates to include entire start and end days
                dateOneMod = strcat(dateOne,' 12AM');
                dateTwoMod = strcat(dateTwo,' 11:59PM');

                % Converts modified dates to number format
                dateOneNum = datenum(dateOneMod);
                dateTwoNum = datenum(dateTwoMod);

                j = 1;      % Initialize stepper variable for output schedule

                % Loop to compare date of each game to input dates
                for i = 1:length(totalSchedule)

                    timeComp = totalSchedule(i).dateTime;

                    if timeComp >= dateOneNum && timeComp <= dateTwoNum
                        gameSchedule(j) = totalSchedule(i);
                        j = j+1;
                    end

                end
        end

        end

        function [scheduleMileage, mileageFee] = getScheduleMileage(scheduleArray, mileageReimbursement, official)

            scheduleMileage = 0;

            % Loop through all games
            for i = 1:length(scheduleArray)

                % Loop through all officials on a particular game
                for j = 1:length(scheduleArray(i).officials)

                    % Test if official is correct offical
                    if strcmp(scheduleArray(i).officials(j).name,official)
                        scheduleMileage = scheduleMileage + scheduleArray(i).officials(j).mileage;
                    end
                end
            end

            % Calculate mileage reimbursement
            mileageFee = scheduleMileage * mileageReimbursement;

        end
        
        function scheduleFees = getScheduleFees(scheduleArray)

            scheduleFees = 0;

            % Loop to sum schedule fees
            for i = 1:length(scheduleArray)
                scheduleFees = scheduleFees + scheduleArray(i).fee;
            end

        end
        
    end
    
end