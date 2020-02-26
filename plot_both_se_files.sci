ModuleName="plot_both_se_files";
Version="0.01";
DateModified="01-Jul-2015";
DateOfCreation="01-Jul-2015";
Author="Rob Eccleston";
Description="Function to plot both parts from SE development spectrometer.";

mprintf("Loading " + ModuleName + " V" +  Version + ", Last Modified: " + DateModified + "\n");

function plot_both_se_files(bg_a, file_a, bg_b, file_b, title_text, n)

plot_wavenums=1 

BGFile_a=bg_a
DataFile_a=file_a
BGFile_b=bg_b
DataFile_b=file_b

[BGAbsorptionData_a, BGWavelengths_a, BGTimeDate_a] = ReadSpectralEnginesData(BGFile_a)
[AllAbsorptionData_a, Wavelengths_a, TimeDate_a] = ReadSpectralEnginesData(DataFile_a)
[BGAbsorptionData_b, BGWavelengths_b, BGTimeDate_b] = ReadSpectralEnginesData(BGFile_b)
[AllAbsorptionData_b, Wavelengths_b, TimeDate_b] = ReadSpectralEnginesData(DataFile_b)


if(plot_wavenums==1) then
BGWavelengths_a=1 ./(BGWavelengths_a*1e-7)
Wavelengths_a=1 ./(Wavelengths_a*1e-7)
BGWavelengths_b=1 ./(BGWavelengths_b*1e-7)
Wavelengths_b=1 ./(Wavelengths_b*1e-7)

end

MeanBGValue_a=mean(BGAbsorptionData_a, 'r')

AbsorptionData_a=AllAbsorptionData_a

MeanAbsorption_a=mean(AbsorptionData_a, 'r')

AbsorptionProfile_a=MeanAbsorption_a./MeanBGValue_a

scf(n)
clf(n)

xtitle(title_text)

subplot(2,2,1)
xtitle("Average")
//plot(BGWavelengths',MeanBGValue')
plot2d(Wavelengths_a',[MeanBGValue_a', MeanAbsorption_a'],[5,2])
hl=legend([BGFile_a;DataFile_a]);

subplot(2,2,3)
xtitle("All absorption data")
plot(Wavelengths_a,AbsorptionProfile_a)


MeanBGValue_b=mean(BGAbsorptionData_b, 'r')

AbsorptionData_b=AllAbsorptionData_b

MeanAbsorption_b=mean(AbsorptionData_b, 'r')

AbsorptionProfile_b=MeanAbsorption_b./MeanBGValue_b


subplot(2,2,2)
xtitle("Average")
//plot(BGWavelengths',MeanBGValue')
plot2d(Wavelengths_b',[MeanBGValue_b', MeanAbsorption_b'],[5,2])
hl=legend([BGFile_b;DataFile_b]);

subplot(2,2,4)
xtitle("All absorption data")
plot(Wavelengths_b,AbsorptionProfile_b)

//scf(1000+n)
//clf(1000+n)




endfunction
