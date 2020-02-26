ModuleName="plot_both_se_files";
Version="0.03";
DateModified="19-Dec-2015";
DateOfCreation="01-Jul-2015";
Author="Rob Eccleston";
Description="Function to plot both parts from SE development spectrometer...
V0.02 modified as there were some problems with the first 2 blank rows having...
extra values, and so the code now checks the expected number of wavelengths...
and reads in this many values. Also fixed an offset error so that all the...
values are read in. Previously, the the last row was missed out....
...
Update: V0.03 19.12.2016...
With Scilab V6.0.0, there seems to be a problem with the read_csv function, ...
as there are not an equal number of columns. Changed to use function mgetl, ...
which seems to work without any further modifications as the text handling is...
done later by the csvTextScan function.";

mprintf("Loading " + ModuleName + " V" +  Version + ", Last Modified: " + DateModified + "\n");

function [ AbsorptionData, Wavelengths, TimeDate ] = ReadSpectralEnginesData(MeasurementFileName)
    RowsToSkip=2
    
    ScanFile=mgetl(MeasurementFileName)
    
    NumRows=size(ScanFile,1)
    
    //NumRows=20
    
    ReadWavelengths=csvTextScan(ScanFile(2,:),ascii(9))
    
    Wavelengths=ReadWavelengths(3:$)
    
    
    ImportedData=[]
    Timestamps=[]
    Dates=[]
    
    Offset=2
    
    
    
    num_wavelengths=size(Wavelengths,2)
    
    
    for i=1:NumRows-Offset
        
        ThisRow=ScanFile(i+Offset)
        
        SplitData=strsplit(ThisRow,ascii(9))
        
        tmp_imported_data=csvTextScan(ThisRow,ascii(9))
        
        ImportedData(i,:)=tmp_imported_data(1:num_wavelengths+2)
        Timestamps(i)=SplitData(1)
        Dates(i)=SplitData(2)
        
        
    end
    
    
    
    AbsorptionData=ImportedData(RowsToSkip+1:NumRows-Offset,3:$)
    
    Timestamps=Timestamps(1+RowsToSkip:$)
    Dates=Dates(1+RowsToSkip:$)
    
    TimeDate=[ Timestamps, Dates ]
    
    Wavelengths=Wavelengths(:,$:-1:1)
    
    //pause
    
    AbsorptionData=AbsorptionData(:,$:-1:1)


    

endfunction
