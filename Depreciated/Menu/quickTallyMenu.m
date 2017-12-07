function choice = quickTallyMenu()

clc;

invalid = 1;

wrong = 0;

while invalid
    
    if wrong
        disp('You have made an invalid choice. Please choose again.');
    end

    disp('You have selected quick tally. Choose from one of the options below.');
    disp('Option 1: Team Tally');
    disp('Option 2: Partner Tally');
    disp('Option 3: Rink Tally');
    disp('Option 4: Level Tally');
    disp('Option 5: Exit');

    choice = input('Choose an option: ');

    if choice < 6 && choice > 0
        invalid = 0;
    else
        wrong = 0;
    end

end
    

end