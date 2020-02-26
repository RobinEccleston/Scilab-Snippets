ModuleName="csv_read_fixed";
Version="0.01";
DateModified="11-Jan-2016";
DateOfCreation="11-Jan-2016";
Author="Rob Eccleston";
Description="";


mprintf("Loading " + ModuleName + " V" +  Version + ", Last Modified: " + DateModified + "\n");

function csv_read_fixed(csv_filename, seperator, row_format, ignore_index)
    
    row_format = ["s", "d", "d", "s", "d"]
    
    fid=mopen(csv_filename, "r")
    txt = mgetl(file_desc)

    
    
endfunction




exec("C:\Users\re\Dropbox\Cologne University\Software\S17 - Scilab Library\re_functions_init.sci");

csv_dir="C:\Users\re\Dropbox\Cologne University\Teagasc Secondment\gas_volume\" //with trailing slash

csv_list=find_csvs_in_dir()


this_csv=csv_list(1)


fid=mopen(this_csv, "r")
txt = mgetl(fid)
seperator=","
row_format = ["s", "d", "d", "s", "d"]

file_len=size(txt,1)

ignored=""
for this_row_num=1:file_len
    
    if find(this_row_num==file_len)==[] //check if we are ignoring this row or not
        ignored=ignored+txt(this_row_num)
    else
        
        this_row=txt(this_row_num)
        
        split_string=strsplit(this_row,seperator)
        
        
    end

end

mclose(fid)
