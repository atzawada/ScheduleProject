function choice = quickSearchMenu()

clc;

invalid = 1;

wrong = 0;

while invalid
    
    if wrong
        disp('You have made an invalid choice. Please choose again.');
    end

    disp('You have selected quick search. Choose from one of the options below.');
    disp('Option 1: Team Search');
    disp('Option 2: Partner Search');
    disp('Option 3: Rink Search');
    disp('Option 4: Level Search');
    disp('Option 5: Exit');

    choice = input('Choose an option: ');

    if choice < 6 && choice > 0
        invalid = 0;
    else
        wrong = 0;
    end

end
    

end