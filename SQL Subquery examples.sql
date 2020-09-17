



/*
select * 
from student 
where gpa > (select avg(gpa) from student)   -- Subquery where your select statement replies on another select statement
	*/										-- (inner must be in parenthese)