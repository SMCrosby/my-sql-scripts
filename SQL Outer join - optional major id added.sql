select *
	from student s
    left join major m 			 -- includes all of the data from table prior(to the left) of join clause
		on m.id = s.majorid
        
        
	/*
	select c.*, i.lastname as 'professor'      -- Shows all from class table and only lastname from instructor table
		from class c
		left join instructor i			-- Another example where lists all classes and instructor name if available
		on i.id = c.instructorid
        */