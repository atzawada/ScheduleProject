% A function to display the main menu and return a selection

function [choice] = mainMenu()

clc;

invalid = 1;

% Loop to continue prompting for options until a correct selection is made
while invalid
    
    % Display options
    disp('Option 1: Read Schedule');
    disp('Option 2: Calculate Fees');
    disp('Option 3: Calculate Mileage');
    disp('Option 4: Quick Search');
    disp('Option 5: Quick Tally');
    disp('Option 6: Display Game Data');
    disp('Option 7: ');
    disp('Option 8:');
    disp('Option 9:');
    disp('Option 10: Exit Program');
    
    % Prompt for user choice
    choice = input('Choose an option: ');
    
    % Switch to check if input is valid or not
    if choice < 11 && choice > 0
        invalid = 0;
    end
end
    
end