function vectNew = vectMember(vectIn,test)

vectLength = length(vectIn);

vectNew = vectIn;

numTimes = 0;

for i = 1:vectLength
    
    if strcmp(vectIn(i),test)
        numTimes = numTimes + 1;
    end
    
end

if numTimes == 0
    vectNew(vectLength + 1) = test;
end

end