select lastname, 'A' as 'ABC' 
	from student
    where sat > 1200
union
select lastname, 'B' as 'ABC'
	from student	
    where sat <= 1200 and sat > 1000
union
select lastname, 'C' as "ABC"
	from student
	where sat <= 1000


/*
select * 
	from student 
	where gpa > (select avg(gpa) from student)   -- Subquery where your select statement replies on another select statement
											 -- (inner must be in parenthese)
    
select * 
	from student
    where sat > (select avg(sat) from student)
order by sat desc
*/

