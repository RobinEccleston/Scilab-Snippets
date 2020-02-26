ModuleName="findallpeaks";
Version="0.01";
DateModified="13-Feb-2015";
DateOfCreation="13-Feb-2015";
Author="Rob Eccleston";
Description="Find peaks in a vector of values, returns two arrays of peaks and troughs.";

mprintf("Loading " + ModuleName + " V" +  Version + ", Last Modified: " + DateModified + "\n")

function [ Peaks, Troughs ] = findallpeaks(y)

    y=y-min(y)
    
    y=y/max(y)

    dydx=diff(y)
    
    ddyddx=diff(dydx)
    
    ZeroCrossings=[]
    
    ThisValue=y(1)
    
    Peaks=[]
    Troughs=[]
    for i=2:max(size(dydx))-1
        ThisValue=dydx(i-1)
        NextValue=dydx(i)
        
        if (ThisValue>0 & NextValue <0) | (ThisValue<0 & NextValue >0) | (ThisValue==0) then
            ZeroCrossings=[ZeroCrossings i]
        end
        
    end
        
    for j=1:max(size(ZeroCrossings))
        Direction=ddyddx(ZeroCrossings(j)-1)
        
        if j>150 then
            //pause
        end
        
        if Direction<0 then
            Peaks=[Peaks ZeroCrossings(j)]
        end
        
        if Direction>0 then
            Troughs=[Troughs ZeroCrossings(j)]
        end
    end

endfunction
