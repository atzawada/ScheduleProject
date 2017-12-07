classdef menu
    
    methods (Static)
        
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
        
        function displayGames(gameData)

            pos = 1;
            dataLen = length(gameData);
            fig = figure;

            counter = uicontrol(        'style','text',...
                                        'position',[250,100,50,20]);

            forwardButton = uicontrol(  'style','pushbutton',...
                                        'string','forward',...
                                        'position',[200,50,50,20],...
                                        'callback', @(counter, pos, dataLen)goForward(source, event, counter, pos, dataLen));

            backwardButton = uicontrol( 'style','pushbutton',...
                                        'string','backward',...
                                        'position',[300,50,50,20],...
                                        'callback', @(pos)goBackward(counter, pos));

            function positionNew = goForward(src, event, uiObj, position, dataLength)
                positionNew = buttonpush.forward(uiObj, position, dataLength);
            end

            function positionNew = goBackward(src, event, uiObj, position)
                positionNew = buttonpush.backward(uiObj, position);
            end

        end
        
    end
    
end