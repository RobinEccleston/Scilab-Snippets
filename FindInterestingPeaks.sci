ModuleName="FindInterestingPeaks";
Version="0.01";
DateModified="06-Mar-2015";
DateOfCreation="06-Mar-2015";
Author="Rob Eccleston";
Description="When passed a waveform, attempts to find interesting peaks, that is ..
peaks that are higher than the surrounding peaks, and so not just a local peak ..
due to noise.";

mprintf("Loading " + ModuleName + " V" +  Version + ", Last Modified: " + DateModified + "\n")

function InterestingPeaks=FindInterestingPeaks(AbsorptionSpectrum)
    
    [Peaks Troughs]=findallpeaks(AbsorptionSpectrum)
    //peaks contains a list of the index of all of the peaks in the passed Array
    //and troughs contains the index of all the troughs.
    
    PeakSampleLength=3 //how many samples will we average it over?
    
    
        
        
    InterestingPeaks=[] //store all of the peaks that pass the test in this variable.
    for i=1:max(size(Peaks)) //loop through all of the peaks that were found
        
        if i==50 then
            //pause
        end
        midpoint=PeakSampleLength/2; //we want to average the same amount of samples on either side.
    
        LowerRange=floor(midpoint); //steps below the sample to check
        UpperRange=ceil(midpoint)-1; //and steps above the sample to check
        
        PeakIndex=Peaks(i) //get the index of the current peak
    
        SampleRange=PeakIndex-PeakSampleLength:PeakIndex+PeakSampleLength //generate indexes over the sample range 
                                                                          //that we will look at
        
        for j=1:max(size(SampleRange)) //loop through each of the indexes for the sample range
            if SampleRange(j)>MaxSampleNumber then //if it is out of bounds
                SampleRange(j)=PeakSampleLength //if it is out of bounds, set it to the index of the value we are
                                                //checking so that it won't have any effect on the output.
            end
             
            if SampleRange(j)<1 then //similarly if it is an invalid index do the same
                SampleRange(j)=PeakSampleLength
            end
        end
        
        MaxValue=0 //temporary variable holding the maximum value in this group
        MaxIndex=0 //the index of the maximum value
        for j=1:max(size(SampleRange))
            TestValue=AbsorptionSpectrum(SampleRange(j)) //get the current test value, which is the value with the index
                                                         //in "SampleRange"
            if TestValue>MaxValue //if it is the largest value we've seen in this group
                MaxValue=TestValue //then update the variables to remember this is the max value
                MaxIndex=SampleRange(j)  //and update the index of it also.
            end
        end
        
        
        if MaxIndex==PeakIndex then //if the index of the peak is also the index of the highest neighbouring values then it
                                    //really is a genuine peak and we should add it to our array.
                                    
            if MaxValue>0 then //set a value if we want to clip the peaks, or set to 0 to allow all.
                InterestingPeaks=[InterestingPeaks PeakIndex]
            end
    
        end
    
end

endfunction
