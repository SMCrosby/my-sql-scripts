update student set
	gpa = 3.51,
	majorid = 
		(select Id from Major where description = 'Accounting')
where id = 191;   				-- Where id in (191, 192, 193)   -- ex if selecting multiple students

select * from student 			  -- Shows the table
order by id desc;

/*
select s.*, (s.gpa + 0.1) as 'New GPA'   -- Showing gpa + 0.1 without changing the database
	From student s;


Select * 							-- A way to find students id
	from student 
	where firstname = 'Noah'
    
    
Update student set 					-- Another update example
	gpa = 2.2,
    SAT = 950
where id = 140;

update student set 					-- Another update example
	gpa = (gpa + 0.1)
    where Sat between 1000 and 1300;
    
Select * from student;

Select * from student;
*/
