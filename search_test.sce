ModuleName=""
Version="0.01"
DateModified="19-Oct-2015"
DateOfCreation="19-Oct-2015"
Author="Rob Eccleston"
Description=""



    test=["a", "b", "c"]
    search_for="d"
    
    search_result=grep(test, search_for)
    
    if search_result<>[]
        mprintf ("found")
    end
    
