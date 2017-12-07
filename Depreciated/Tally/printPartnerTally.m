function printPartnerTally(partnerVec, timesVec)

numPartners = length(partnerVec);

for i = 1:numPartners
    
    partnerData(i).name = partnerVec(i);
    partnerData(i).times = timesVec(i);
    
end

partnerSwitch = freq.empty;
numSwitches = 1;

while numSwitches > 0
    
    numSwitches = 0;

    for i = 1:numPartners-1

        partnerFirst = partnerData(i);
        partnerSecond = partnerData(i+1);

        if partnerFirst.times < partnerSecond.times

            partnerSwitch = partnerFirst;
            partnerFirst = partnerSecond;
            partnerSecond = partnerSwitch;

            partnerData(i) = partnerFirst;
            partnerData(i+1) = partnerSecond;

            numSwitches = numSwitches + 1;

        end
    end
end

struct2table(partnerData)

end