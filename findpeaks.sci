ModuleName="findpeaks";
Version="0.01";
DateModified="12-Feb-2015";
DateOfCreation="12-Feb-2015";
Author="Joe Ainsworth";
Description="JAs attempt at a function to find peaks. Uses a threshold to ingore smaller peaks.";

mprintf("Loading " + ModuleName + " V" +  Version + ", Last Modified: " + DateModified + "\n")

function [ morepeaks ] = findpeaks(in, thresh, dbug)
	// FINDPEAKS returns an array of indices for all peaks over a certain percentage
	// of the mximum value, that percentage being given by thresh.

	// a little input validation to start us off
	if (thresh < 0 | thresh > 1)
		printf('FINDPEAKS: Error - thresh must be between 0 and 1\n');
	end
	
	if ~(dbug == 0 | dbug == 1)
		printf('FINDPEAKS: Error - dbug should be 0 or 1\n');
	end

    in=in-min(in)
	
	// get maximum value first
	maxval = max(abs(in));

	// get all indices greater than the threshold
	morepeaks = find(abs(in) > thresh*abs(maxval));

	// then try and reduce the number of hits by eliding adjacents
	
	// take the diff to get the difference between consecutive indices
	diffmp = diff(morepeaks);
	// pick out the ones where the difference is 1, i.e. the points are adjacent
	consecmp = find(diffmp == 1);

	// work backwards from the end of the list of consecutive indices
	for i = consecmp($:-1:1)
		// get the index referenced by the current position in the consecmp list
		mpindex(1) = morepeaks(i);
		// and the one after it (there will always be one after it because the last element of the diff is the difference between the penultimate and last elements of the in array)
		mpindex(2) = morepeaks(i+1);
		// find which one of these has the smaller value
		[mpbin, mpbinI] = min(abs([in(mpindex(1)) in(mpindex(2))]));
		// if they've got the same sign get rid of it by creating a new array that doesn't have that one in
		if sign(in(mpindex(1)))==sign(in(mpindex(2)))
			morepeaks = [morepeaks(1:i-1+(mpbinI-1)) morepeaks(i+1+(mpbinI-1):$)];
		end
		// the reason we started at the end is that it doesn't mess up the remaining indices
		if (dbug)
			for j = 1:length(morepeaks)
				printf('%d ', morepeaks(j) );
			end
			printf('\n');
		end // of debug output
	end
endfunction
