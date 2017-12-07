% Function to return total mileage and reimbursement for an input schedule

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