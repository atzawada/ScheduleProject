% Function to prompt for a schedule file and read in the raw data

function [dataNum, dataTxt, dataRaw] = readSchedule()

% Prompt for file to read from
[filename, pathname] = uigetfile('.xls','Pick a schedule File');

% Concatenate file and path names to get file location
fileLocation = strcat(pathname,filename);

% Read raw data from Excel file
[dataNum, dataTxt, dataRaw] = xlsread(fileLocation,1,'A:Z');

end