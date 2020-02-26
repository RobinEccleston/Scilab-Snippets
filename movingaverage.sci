ModuleName="movingaverage";
Version="0.01";
DateModified="13-Feb-2015";
DateOfCreation="13-Feb-2015";
Author="Rob Eccleston";
Description="When given a waveform and the number of samples to average, returns ..
a waveform with a smoothed average for the given number of sampels";

mprintf("Loading " + ModuleName + " V" +  Version + ", Last Modified: " + DateModified + "\n")

function [ SmoothedWaveform ] = movingaverage(y,NumToAverage)

    x=y
    midpoint=NumToAverage/2;
        
    LowerRange=floor(midpoint);
    UpperRange=ceil(midpoint)-1;
    
    x_ave=0;
    for i=1+LowerRange:max(size(x))-UpperRange
        x_ave(i)=sum(x(i-LowerRange:i+UpperRange))/NumToAverage;
    end
    
    SmoothedWaveform=x_ave;


endfunction
