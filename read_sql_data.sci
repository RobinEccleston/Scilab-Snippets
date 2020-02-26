ModuleName="read_sql_data.sci";
Version="0.02";
DateModified="19-May-2015";
DateOfCreation="07-May-2015";
Author="Rob Eccleston";
Description="Read sql data in a file from :metabolon PC";

function [time_cut, date_cut, time_date_cut, timestamps, co2_cut, methane_cut, h2s_cut, h2_cut]=read_sql_file(file_path)
    
    printf("Reading SQL CSV File...")
    //file_path="C:\Users\re\Dropbox\Cologne University\Software\S20 - Scilab read SQL data\opcdb300.csv"
    
    csv_file=read_csv(file_path)
    
    time_date=csv_file(:,1);
    co2_str=csv_file(:,7);
    methane_str=csv_file(:,12);
    h2s_str=csv_file(:,22);
    h2_str=csv_file(:,27);
    
    co2=strtod(co2_str)
    methane=strtod(methane_str);
    h2s=strtod(h2s_str);
    h2=strtod(h2_str);
    
    
    time_date_short=time_date(1:10);
    num_samples=size(time_date,1);
    
    
    str_date=[];
    str_time=[];
    
    for i=2:num_samples
        
        time_date_split=strsplit(time_date(i)," ");
        str_date(i)=time_date_split(1);
        str_time(i)=time_date_split(2);
    end
    
    changes_list=[];
    for i=3:num_samples
        
        co2_change=co2(i)-co2(i-1);
        methane_change=methane(i)-methane(i-1);
        h2s_change=h2s(i)-h2s(i-1);
        h2_change=h2(i)-h2(i-1);
        
        change_here=co2_change | methane_change | h2s_change | h2_change;
        
        if(change_here)
            changes_list=[changes_list i];
        end
        
        
    end
    
    time_cut=str_time(changes_list);
    date_cut=str_date(changes_list);
    time_date_cut=time_date(changes_list);
    co2_cut=co2(changes_list);
    methane_cut=methane(changes_list);
    h2s_cut=h2s(changes_list);
    h2_cut=h2(changes_list);
    
    shorter_numsamples=size(time_cut,1)
    
    timestamps=[]
    for i=1:shorter_numsamples
        
        date_split=strsplit(date_cut(i),"-")
        time_split=strsplit(time_cut(i),":")
        
        year_str=date_split(1)
        month_str=date_split(2)
        day_str=date_split(3)
        hour_str=time_split(1)
        minute_str=time_split(2)
        second_str=time_split(3)
        
        this_timestamp = time_since_epoch_str(year_str,month_str,day_str,hour_str,minute_str,second_str)
        
        timestamps(i)=this_timestamp
    end
    
    printf("File reading completed.")

endfunction
















