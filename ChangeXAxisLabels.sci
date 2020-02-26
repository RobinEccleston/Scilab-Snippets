ModuleName="ChangeXAxisLabels";
Version="0.01";
DateModified="13-Apr-2015";
DateOfCreation="13-Apr-2015";
Author="Rob Eccleston";
Description="Changes X axis labels to those given in the array passed to the function ..
Needs to be passed an array of strings the same length as the number of ..
data points that have been plotted. Function should be called immediately ..
after plot command is used";

mprintf("Loading " + ModuleName + " V" +  Version + ", Last Modified: " + DateModified + "\n");

function ChangeXAxisLabels(NewLabels)
    
    a=gca()
    tickdata=a.x_ticks.labels
    
    tickindex=strtod(strsubst(tickdata, " ", ""))
    tickindex=tickindex(2:$)
    MaxNumberOfSamples=size(a.children(1).children(1).data,1)


    OutOfBoundsValues=find(tickindex>MaxNumberOfSamples)
    tickindex(OutOfBoundsValues)=MaxNumberOfSamples
    
    XAxisValues=NewLabels(tickindex,1)
    XAxisValues(OutOfBoundsValues)=""
    XAxisValues = [ "Start"; XAxisValues]
    
    a.x_ticks.labels=XAxisValues

endfunction

function ChangeYAxisLabels(NewLabels)
    
    a=gca()
    tickdata=a.y_ticks.labels
    
    tickindex=strtod(strsubst(tickdata, " ", ""))
    tickindex=tickindex(2:$)
    MaxNumberOfSamples=size(a.children(1).children(1).data,1)
    OutOfBoundsValues=find(tickindex>MaxNumberOfSamples)
    tickindex(OutOfBoundsValues)=MaxNumberOfSamples
    
    XAxisValues=NewLabels(tickindex,1)
    XAxisValues(OutOfBoundsValues)=""
    XAxisValues = [ "Start"; XAxisValues]
    
    a.x_ticks.labels=XAxisValues

endfunction

function ChangeXAxisLabelsSurf(NewLabels)
    
    a=gca()
    tickdata=a.x_ticks.labels
    
    tickindex=strtod(strsubst(tickdata, " ", ""))
    tickindex=tickindex(2:$)
    MaxNumberOfSamples=size(unique(a.children(1).data.x),1)
    OutOfBoundsValues=find(tickindex>MaxNumberOfSamples)
    tickindex(OutOfBoundsValues)=MaxNumberOfSamples
    
    XAxisValues=NewLabels(tickindex,1)
    XAxisValues(OutOfBoundsValues)=""
    XAxisValues = [ "Start"; XAxisValues]
    
    a.x_ticks.labels=XAxisValues

endfunction

function ChangeYAxisLabelsSurf(NewLabels)
    
    a=gca()
    tickdata=a.y_ticks.labels
    
    tickindex=strtod(strsubst(tickdata, " ", ""))
    tickindex=tickindex(2:$)
    MaxNumberOfSamples=size(unique(a.children(1).data.y),1)
    OutOfBoundsValues=find(tickindex>MaxNumberOfSamples)
    tickindex(OutOfBoundsValues)=MaxNumberOfSamples
    
    YAxisValues=NewLabels(tickindex,1)
    YAxisValues(OutOfBoundsValues)=""
    YAxisValues = [ "Start"; YAxisValues]
    
    a.y_ticks.labels=YAxisValues

endfunction
