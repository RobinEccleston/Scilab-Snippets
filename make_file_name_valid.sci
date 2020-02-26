ModuleName="make_file_name_valid";
Version="0.01";
DateModified="25-Aug-2015";
DateOfCreation="25-Aug-2015";
Author="Rob Eccleston";
Description="Function to remove invalid characters from filenames";

mprintf("Loading " + ModuleName + " V" +  Version + ", Last Modified: " + DateModified + "\n");

function [valid_file_name] = make_file_name_valid(raw_file_name)
    
    dest_filename=raw_file_name
    dest_filename=strsubst(dest_filename, '/', '_')
    dest_filename=strsubst(dest_filename, '\', '_')
    dest_filename=strsubst(dest_filename, ':', '_')
    dest_filename=strsubst(dest_filename, '*', '_')
    dest_filename=strsubst(dest_filename, '?', '_')
    dest_filename=strsubst(dest_filename, '""', '_')
    dest_filename=strsubst(dest_filename, '<', '_')
    dest_filename=strsubst(dest_filename, '>', '_')
    dest_filename=strsubst(dest_filename, '|', '_')
    
    valid_file_name=dest_filename

endfunction
