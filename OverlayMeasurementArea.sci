ModuleName="OverlayMeasurementArea";
Version="0.01";
DateModified="11-Mar-2015";
DateOfCreation="11-Mar-2015";
Author="Rob Eccleston";
Description="For the current active graph and axes, overlays a green transparent ..
box at the wavelengths set in this function. It gets the maximum and minimum ..
amplitudes from the current properties of the graph when drawn, and sets the ..
top and bottom positions to these.";

mprintf("Loading " + ModuleName + " V" +  Version + ", Last Modified: " + DateModified + "\n")

function OverlayMeasurementArea()
    
    m=hypermat([1 3 4])
    m(:,:,1)=[0,0,0]; //r
    m(:,:,2)=[1,1,1]; //g
    m(:,:,3)=[0,0,0]; //b
    m(:,:,4)=[0.13,0.13,0.13]; //a
    
    set figure_style new;
    a=gca();
    
    a.data_bounds(:,2)
    
    LowPoint=min(a.data_bounds(:,2))
    TopPoint=max(a.data_bounds(:,2))
    
    a.axes_visible="on";
    
    //range 6.8um to 8um
    //StartPoint=1470
    //EndPoint=1250
    //Matplot1(m(1,2,:),[StartPoint,LowPoint,EndPoint,TopYPoint]);
    
    //range = 6.5-7.5um
    //1538cm-1 to 1333cm-1
    StartPoint=1333
    EndPoint=1538
    Matplot1(m(1,1,:),[StartPoint,LowPoint,EndPoint,TopPoint]);
    
    //range 8-10um
    //1250cm-1 to 1000cm-1
    StartPoint=1250
    EndPoint=1000
    Matplot1(m(1,1,:),[StartPoint,LowPoint,EndPoint,TopPoint]);
    
    a=gce()
    a.image_type="rgba"

endfunction
