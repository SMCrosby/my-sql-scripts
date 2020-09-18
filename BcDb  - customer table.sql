Create table Customers (

	Id int not null primary key auto_increment,
    Code varchar(10) not null unique,
    Name varchar(30) not null,
    Sales decimal(9,2) default 0 not null
		check (Sales >= 0), 
	Active bit not null default 1,
    Created datetime not null default current_timestamp 
    
    );
