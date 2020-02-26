ModuleName="plot_se_files_and_reference";
Version="0.01";
DateModified="03-Jul-2015";
DateOfCreation="03-Jul-2015";
Author="Rob Eccleston";
Description="Function to plot both parts from SE development spectrometer against reference data.";

mprintf("Loading " + ModuleName + " V" +  Version + ", Last Modified: " + DateModified + "\n");

function [snr] = plot_se_files_and_ref(bg_a, file_a, bg_b, file_b, reference_file)

snr=0

plot_wavenums=0 
normalise=2
show_legend=1

SampleMin=209 //800cm-1 sample
SampleMax=728 //1800cm-1 sample
SampleMax=624
SampleMin=250

resize_plot=1


if(resize_plot==1)
f=gcf()
f.figure_size=[1500,800]
end


BGFile_a=bg_a
DataFile_a=file_a
BGFile_b=bg_b
DataFile_b=file_b

[BGAbsorptionData_a, BGWavelengths_a, BGTimeDate_a] = ReadSpectralEnginesData(BGFile_a)
[AllAbsorptionData_a, Wavelengths_a, TimeDate_a] = ReadSpectralEnginesData(DataFile_a)
[BGAbsorptionData_b, BGWavelengths_b, BGTimeDate_b] = ReadSpectralEnginesData(BGFile_b)
[AllAbsorptionData_b, Wavelengths_b, TimeDate_b] = ReadSpectralEnginesData(DataFile_b)

AbsorptionData_a=AllAbsorptionData_a
AbsorptionData_b=AllAbsorptionData_b

MeanBGValue_a=mean(BGAbsorptionData_a, 'r')
MeanBGValue_b=mean(BGAbsorptionData_b, 'r')
MeanAbsorption_a=mean(AbsorptionData_a, 'r')
MeanAbsorption_b=mean(AbsorptionData_b, 'r')




AbsorptionProfile_a=MeanAbsorption_a./MeanBGValue_a
//AbsorptionProfile_a=1-AbsorptionProfile_a

AbsorptionProfile_b=MeanAbsorption_b./MeanBGValue_b
//AbsorptionProfile_b=1-AbsorptionProfile_b


max_scale_factor=max([MeanAbsorption_a, MeanAbsorption_b])
//AbsorptionProfile_a=MeanAbsorption_a/max_scale_factor
//AbsorptionProfile_b=MeanAbsorption_b/max_scale_factor





if reference_file<>"" then
    
        


    ScanFile=csvRead(reference_file)
    xdata=ScanFile(:,1)

    ydata=ScanFile(:,2)
    
    if(max(size(xdata))>7000)
        xdata=xdata(1:4:$,:)
        ydata=ydata(1:4:$,:)
    end
    
    xdata_nm=1e7 ./ xdata
    reference_x_axis=xdata(SampleMin:SampleMax)
    reference_y_axis=ydata(SampleMin:SampleMax)
    
    if normalise==1 | normalise==2 then
        reference_y_axis=reference_y_axis-min(reference_y_axis)
        reference_y_axis=reference_y_axis/max(reference_y_axis)
    end

else 
    reference_x_axis = [BGWavelengths_a BGWavelengths_b]
    reference_y_axis = [AbsorptionProfile_a AbsorptionProfile_b]
    
    [b,k]=gsort(reference_x_axis)
    
    reference_x_axis=reference_x_axis(k)
    reference_y_axis=reference_y_axis(k)
    
    //reference_x_axis
    xdata_nm=reference_x_axis

    
    
end






if plot_wavenums==0  then
    
    if reference_file<>"" then
        
        reference_x_axis=1e7 ./ reference_x_axis
        xmax=xdata_nm(SampleMin)
        xmin=xdata_nm(SampleMax)
        
    else
        xmax=max(xdata_nm)
        xmin=min(xdata_nm)
        
    end

else

    xmin=xdata(SampleMin)
    xmax=xdata(SampleMax)
end
//
//if normalise==1 then
//    reference_y_axis=reference_y_axis-min(reference_y_axis)
//    reference_y_axis=reference_y_axis./max(reference_y_axis)
//end


ymax=max(max(reference_y_axis), max(AbsorptionProfile_a), max(AbsorptionProfile_b))
ymin=min(min(reference_y_axis), min(AbsorptionProfile_a), min(AbsorptionProfile_b))



a=gca()

xlabel("Wavelength (nm)")
    
if reference_file<>"" then
    if plot_wavenums==1  then
        plot2d(reference_x_axis,reference_y_axis,rect=[500,ymin,1100,ymax])
        a.axes_reverse=["on" "off" "off"]
        xlabel("Wavenumber (cm-1)")
        
    else
        plot2d(reference_x_axis,reference_y_axis,rect=[xmin,ymin,xmax,ymax])
    end
end

ylabel("Absorption")
if normalise==1 | normalise==2 then
    ylabel("Absorption (Normalised)")
end





if(plot_wavenums==1) then

    
    BGWavelengths_a=1 ./(BGWavelengths_a*1e-7)
    Wavelengths_a=1 ./(Wavelengths_a*1e-7)
    BGWavelengths_b=1 ./(BGWavelengths_b*1e-7)
    Wavelengths_b=1 ./(Wavelengths_b*1e-7)

end



if normalise==2 then
    both_min=min([min(AbsorptionProfile_a) min(AbsorptionProfile_b)])
    AbsorptionProfile_a=AbsorptionProfile_a-both_min
    AbsorptionProfile_b=AbsorptionProfile_b-both_min
    
    both_max=max([max(AbsorptionProfile_a) max(AbsorptionProfile_b)])
    AbsorptionProfile_a=AbsorptionProfile_a./both_max
    AbsorptionProfile_b=AbsorptionProfile_b./both_max
end

if normalise==1 then
    AbsorptionProfile_a=AbsorptionProfile_a-min(AbsorptionProfile_a)
    AbsorptionProfile_a=AbsorptionProfile_a./max(AbsorptionProfile_a)
end

AbsorptionProfile_a=1-AbsorptionProfile_a
plot(Wavelengths_a,AbsorptionProfile_a)


if normalise==1 then
    AbsorptionProfile_b=AbsorptionProfile_b-min(AbsorptionProfile_b)
    AbsorptionProfile_b=AbsorptionProfile_b./max(AbsorptionProfile_b)
end

AbsorptionProfile_b=1-AbsorptionProfile_b
plot(Wavelengths_b,AbsorptionProfile_b)

if show_legend==1 then
    legend("FTIR Reference Measurement", "MEMS Sensor Measurement")
    
    a=get("current_axes");
    l=a.children(1);
    l.line_width=0.04
end

//
//params=[]
//for colnum=1:numcols
//    this_col=AbsorptionData(:,colnum);
//    this_std_dev=stdev(this_col)
//    this_col_mean=mean(this_col)
//    this_snr=this_col_mean/this_std_dev
//    
//    params=[params; [this_std_dev this_col_mean this_snr]]
//    
//end


endfunction
