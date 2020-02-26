ModuleName="FindMaxPeaks";
Version="0.01";
DateModified="15-Mar-2015";
DateOfCreation="15-Mar-2015";
Author="Rob Eccleston";
Description="Attempts to find highest peaks in a waveform.";

mprintf("Loading " + ModuleName + " V" +  Version + ", Last Modified: " + DateModified + "\n")

function [PeakIndicies] = FindMaxPeaks(ThisWaveform, NumPeaks, InitialThreshold)

        PeakIndicies=1;
        Threshold=InitialThreshold;
        LoopEnd=0;
        PeakIndicies_tmp=1;
        PeakIndicies_tmp2=1;
        Increment=0.01
        Error=0

            for(i=1:100) do
                Threshold=Threshold-Increment;
                try
                    PeakIndicies_tmp=peakandzero(ThisWaveform,Threshold,0);
                catch
                    printf("Peak Index Error\n");
                    Error=1
                    
                    if Threshold==InitialThreshold then
                        Error=2
                    end
                    
                    Threshold=Threshold+Increment;
                    
                end

                //printf("Threshold = %f    Peaks = %d\n", Threshold, size(PeakIndicies_tmp,1));
                
                if Error>0 then
                    break
                end
                
                if (size(PeakIndicies_tmp,1))>NumPeaks then
                    Threshold=Threshold+Increment;
                    break
                end
            end
        
        if Error==0 then
            


            try
                PeakIndicies_tmp2=peakandzero(ThisWaveform,Threshold,0);
            catch
                printf("Peak finding failed...\n");
                PeakIndicies=[1];
            end
            PeakIndicies=PeakIndicies_tmp2;
            
        else
            PeakIndicies=1
        end
            
            
            //printf("Error Status: %d\n", Error)
endfunction
