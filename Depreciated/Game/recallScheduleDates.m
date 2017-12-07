% Variable input function to return a range of games from the original
% schedule

function gameSchedule = recallScheduleDates(totalSchedule,varargin)

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