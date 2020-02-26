ModuleName="time_since_epoch";
Version="0.01";
DateModified="07-May-2015";
DateOfCreation="07-May-2015";
Author="Rob Eccleston";
Description="";

mprintf("Loading " + ModuleName + " V" +  Version + ", Last Modified: " + DateModified + "\n");

function num_seconds=time_since_epoch(year,month,day,hour,minute,second)
    //a=time_since_epoch(2015,5,8,13,50,1)
    
    e_year=1970
    e_month=1
    e_day=1
    e_hour=0
    e_minute=0
    e_second=0
    
    epoch_num_days = datenum(e_year, e_month, e_day, e_hour, e_minute, e_second)
    
    num_days = datenum(year, month, day, 0, 0, 0)
    
    days_since_epoch=num_days-epoch_num_days
    
    num_seconds = ( ( ( days_since_epoch * 24 + hour ) * 60 + minute ) * 60 ) + second
    
    
endfunction

function num_seconds=time_since_epoch_str(year_str,month_str,day_str,hour_str,minute_str,second_str)
    //a=time_since_epoch("2015","5","8","13","50","1")
    
    year_int=strtod(year_str)
    month_int=strtod(month_str)
    day_int=strtod(day_str)
    hour_int=strtod(hour_str)
    minute_int=strtod(minute_str)
    second_int=strtod(second_str)
    
    num_seconds=time_since_epoch(year_int,month_int,day_int,hour_int,minute_int,second_int)
    
endfunction

function num_seconds=time_since_epoch_broken(year,month,day,hour,minute,second)
    
    
//    year=1970
//    month=1
//    day=1
//    hour=0
//    minute=0
//    second=0
    
    e_year=1970
    e_month=1
    e_day=1
    e_hour=0
    e_minute=0
    e_second=0
    
    year_array=e_year:year
    
    leap_years=is_leapyear_array(year_array)
    num_leap_days=sum(leap_years)
    
    month_lengths=[31 28 31 30 31 30 31 31 30 31 30 31]
    
    days_in_full_years=365*(year-e_year)+num_leap_days
    days_in_full_months=sum(month_lengths(1:month-1))
    
    num_days = days_in_full_years + days_in_full_months + day - 1
    
    seconds_from_days = num_days * 24 * 60 * 60
    
    num_seconds = ( ( (num_days * 24) + hour ) * 60 + minute ) * 60 + second
    
endfunction

function leapyear=is_leapyear(Year)
    
    leapyear=0
        if(modulo(Year,4)==0)
        leapyear=1
            
        if(modulo(Year,100)==0)
            leapyear=0
            
            if(modulo(Year,400)==0)
                leapyear=1
            end
        end
    end
    
endfunction

function leapyear_array=is_leapyear_array(year_array)
    
    num_years=max(size(year_array))
    
    leapyear_array=[]
    
    for index=1:num_years
        year_to_test=year_array(index)
        is_leap=is_leapyear(year_to_test)
        leapyear_array=[leapyear_array is_leap]
    end
    
    
endfunction
