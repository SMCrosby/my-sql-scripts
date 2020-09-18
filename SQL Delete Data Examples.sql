delete from student
	where id = 
    (select id where firstname = 'Noah' and lastname = "Phense");