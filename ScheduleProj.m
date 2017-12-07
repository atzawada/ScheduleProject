% Schedule Program Project -- Andy Zawada 2017
% Top level script file for Schedule Program Project

clc;        % Clear the console

% Read in raw schedule data
[dataNum, dataTxt, dataRaw] = readSchedule();

% Prompt and store officials name
name = input('What is your name: ','s');

% Read in game array from raw data
gameData = game.readData(dataTxt, dataNum, name);

% Set initial schedule array to all game data
scheduleNew = gameData;

keepGoing = 1;

% Loop to create initial program environmet
while keepGoing

    % Prompt for main menu and store selection
    selection = mainMenu();

    % Switch to return functions for the option selected
    switch selection
        case 1
            clc;
            choice = input('You chose read schedule. Enter 1 for a date range, or 2 for all: ');
            if choice == 1
                startDate = input('Enter Start Date (DD/MM/YYYY): ');
                endDate = input('Enter End Date (DD/MM/YYYY): ');
                scheduleNew = recallScheduleDates(gameData,startDate,endDate);
            else
                scheduleNew = recallScheduleDates(gameData,'all');
            end
        case 2
            clc;
            scheduleFees = getScheduleFees(scheduleNew);
            disp('You have selected display schedule fees')
            fprintf('Your game fees are %i USD',scheduleFees);
            pause
        case 3
            clc;
            disp('You have selected mileage report');
            reimbursement = input('What is your mileage reimbursement: ');
            [mileageSchedule, mileageFee] = getScheduleMileage(scheduleNew,reimbursement,name);
            fprintf(' your schedule mileage is %i, and your mileage reimbursement is %0.2f USD',mileageSchedule, mileageFee);
            pause
        case 4
            clc;
            quickSearch(scheduleNew);
        case 5
            quickTally(scheduleNew, name);
        case 6
            displayGames
        case 7
        case 8
        case 9
        case 10
            clc;
            return
    end

end