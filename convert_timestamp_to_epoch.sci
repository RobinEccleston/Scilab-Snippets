ModuleName="convert_timestamp_to_epoch"
Version="0.01"
DateModified="21-Oct-2015"
DateOfCreation="21-Oct-2015"
Author="Rob Eccleston"
Description=""


mprintf("Loading " + ModuleName + " V" +  Version + ", Last Modified: " + DateModified + "\n");

//example = !11:36:04  30/06/2015  !

function num_seconds=convert_timestamp_to_epoch(datetime)

try
    this_timestamp=datetime(1)
    this_datestamp=datetime(2)
    
    
    split_time=strsplit(this_timestamp,":")
    this_hour=strtod(split_time(1)) 
    this_min=strtod(split_time(2)) 
    this_sec=strtod(split_time(3))
    
    split_date=strsplit(this_datestamp,"/")
    this_day=strtod(split_date(1)) 
    this_month=strtod(split_date(2)) 
    this_year=strtod(split_date(3)) 
    
    num_seconds=time_since_epoch(this_year,this_month,this_day,this_hour,this_min,this_sec)
catch
    mprintf("Error in " + ModuleName + " when attempting to convert timestamp to epoch!\n...
    Should take the format !hh:mm:ss  DD/MM/YYYY  !\n...
    eg !11:36:04  30/06/2015  \n\n...
    This should be as an array of two strings!")
end

    
endfunction
