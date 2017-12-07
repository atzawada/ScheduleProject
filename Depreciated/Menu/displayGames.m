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