% Function to return total schedule fees for input schedule

function scheduleFees = getScheduleFees(scheduleArray)

scheduleFees = 0;

% Loop to sum schedule fees
for i = 1:length(scheduleArray)
    scheduleFees = scheduleFees + scheduleArray(i).fee;
end

end