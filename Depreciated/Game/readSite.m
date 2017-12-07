function [siteOut] = readSite(dataIn,i)

siteOutLineOne = char(dataIn(i,9));

siteOutLineTwo = char(dataIn(i+1,9));

if ~cellfun('isempty',dataIn(i+1,9))
    siteOutCell = strcat({siteOutLineOne},{siteOutLineTwo});
    siteOut = char(siteOutCell);
else
    siteOut = siteOutLineOne;
end

end