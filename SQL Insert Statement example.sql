Insert student (Id, Firstname, lastname, SAT, GPA, MajorId) -- Can only omit if null is allowed in column
	Values 
    (0,'Noah', 'Phense', 1235, 3.15,    -- Put 0 for ID
    (select Id from major 					-- Subquery to find Id # for Math
		where description = 'Math'))