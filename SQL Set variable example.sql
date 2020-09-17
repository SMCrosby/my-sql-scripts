set @maxgpa = 3.5;   -- must be run first to set variable (don't forget to add ; )
set @mingpa = 2.0;

select *
	from student 
    where gpa between @mingpa and @maxgpa		-- (between is always inclusive)
    order by gpa 

/*
set @maxsat = 1100;
select *
	from student 
    where sat > @maxsat
    order by sat desc
    */