ModuleName="ReadSEFileSubtractBG";
Version="0.01";
DateModified="20-Apr-2015";
DateOfCreation="20-Apr-2015";
Author="Rob Eccleston";
Description="When given a measurement file and a BG file, returns the absorption ..
    spectra as divived by the BG measurement. Made as a separate function as might want ..
    to interpolate for different size files in future, or at least do something to handle ..
    the problem a bit more graciously.";

mprintf("Loading " + ModuleName + " V" +  Version + ", Last Modified: " + DateModified + "\n");


function [ AbsorptionProfile, Wavelengths, RawSpectra ] = ReadSEFileSubtractBG(MeasurementFileName, BGFileName)
    
    [AllAbsorptionData, Wavelengths, TimeDate] = ReadSpectralEnginesData(MeasurementFileName);
    MeanAbsorption=mean(AllAbsorptionData, 'r');
    RawSpectra=MeanAbsorption
    
    [AllAbsorptionDataBG, WavelengthsBG, TimeDateBG] = ReadSpectralEnginesData(BGFileName);
    MeanAbsorptionBG=mean(AllAbsorptionDataBG, 'r');
    
    AbsorptionProfile=MeanAbsorption./MeanAbsorptionBG;
    
endfunction
