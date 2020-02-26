ModuleName="MovingAverage";
Version="0.01";
DateModified="07-May-2015";
DateOfCreation="07-May-2015";
Author="Rob Eccleston";
Description="Takes a moving average for the data provided in a matrix";

function [ averaged_data ]= moving_average_matrix(data,window_size,direction)

    //change the data direction if we are averaging across columns
    if direction =='c' then
        data=data'
    end
    
    //get the data set dimensions
    [num_rows, num_cols]=size(data)
    
    //if there is only one column, we will need to create an extra
    //empty column when averaging in order for the syntax to work
    if num_cols==1 then
        num_cols_to_analyse=2
    else
        num_cols_to_analyse=num_cols
    end
    
    //initialise empty matrix for the needed dimensions
    averaged_samples=zeros(num_rows, num_cols_to_analyse)
    
    for i=1:num_rows-window_size-1
        
        //perform averaging
        averaged_samples(i,:)=sum(data(i:i+window_size-1,:),'r')/(window_size)
        
    end
    
    //cut off zero values at end and empty column if present
    averaged_data=averaged_samples(1:$-window_size-1,1:num_cols)
    
    
    //change the data direction again
    if direction =='c' then
        averaged_data=averaged_data'
    end

endfunction
