ModuleName="JaggedCombine";
Version="0.01";
DateModified="06-Mar-2015";
DateOfCreation="06-Mar-2015";
Author="Rob Eccleston";
Description="Function that takes multiple variables as arguments ..
The first value should be the default value that all cells ..
are initialised to. Then the arrays should be passed. ..
This assumes that only 1xN or Nx1 matrices will be passed, ..
and so doesnt do anything more sophisticated to combine ..
multiple rows/columns";

mprintf("Loading " + ModuleName + " V" +  Version + ", Last Modified: " + DateModified + "\n")

function JaggedArray=JaggedCombine(DefaultValue, varargin)
    
    [lhs,rhs]=argn(0) //get number of arguments
    
    if rhs>=1 then
        MaxSize=0
        
        //for each array, check if it's longer than the previous max
        //and if so, update the value
        for i=1:rhs-1
            if MaxSize<max(size(varargin(i)))
                MaxSize=max(size(varargin(i)))
            end
        end
        
        //initialise a new array which is big enough to hold all the
        //data
        NewArray=ones(rhs-1,MaxSize)
        NewArray=NewArray*DefaultValue //set to user's default value
        
        //Add each array we were passed to the newly created array
        for i=1:rhs-1
            ThisArray=varargin(i)
            
            if (size(ThisArray,2)==1)
                ThisArray=ThisArray'
            end
             
            NumCols=size(ThisArray,2)
            
            NewArray(i,1:NumCols)=ThisArray
            
        end
        
        JaggedArray=NewArray
        
    end
endfunction
