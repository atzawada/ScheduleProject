% Function to return an member of class official given a certain line

function [officialOut] = readOfficial(dataInTxt,dataInNum,i)

officialOut = official;

officialOut.position = char(dataInTxt(i,2));
officialOut.name = char(dataInTxt(i,4));
officialOut.mileage = dataInNum(i-11,8);
officialOut.number1 = char(dataInTxt(i,10));
officialOut.number2 = char(dataInTxt(i,14));

end