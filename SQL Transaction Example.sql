-- Select * from user;
Start Transaction;

insert user (Username, Password, Firstname, Lastname, phonenumber, email)
	Values
    ('XX', 'XX', 'XX', 'XX', 'XX', 'XX');

Rollback;

    Select * From User;

/*
If @errors <> 0    -- unsure of correct syntax for MySQL
	Rollback
Else
	Commit
    */
    

