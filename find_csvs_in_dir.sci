ModuleName="find_csvs_in_dir";
Version="0.01";
DateModified="11-Jan-2016";
DateOfCreation="11-Jan-2016";
Author="Rob Eccleston";
Description="Lists all csvs in current directory and returns them as a list";


mprintf("Loading " + ModuleName + " V" +  Version + ", Last Modified: " + DateModified + "\n");


function [csv_list]=find_csvs_in_dir(working_dir)

    
    mprintf("Loading " + ModuleName + " V" +  Version + ", Last Modified: " + DateModified + "\n");
    
    
    //working_dir="C:\Users\re\Dropbox\Cologne University\Teagasc Secondment\gas_volume\" //with end slash
    
    directory_contents=listfiles(working_dir)
    
    num_files=size(directory_contents,1)
    
    csv_list=""
    j=1
        
    for i=1:num_files
        this_full_name=working_dir + directory_contents(i)
        
        this_extension = fileext(this_full_name)
        
        this_extension = convstr(this_extension, "l") //convert to lowercase
        
        
        if this_extension== ".csv"
            disp(this_full_name)
            csv_list(j)=this_full_name
            j=j+1
        end
        
    
    end

endfunction
