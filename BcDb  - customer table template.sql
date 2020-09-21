Use Sys;
Drop Database if exists BcDb;
Create database BcDb;
Use BcDb;

Create table Customers (
	Id int not null primary key auto_increment,
    Code varchar(10) not null,
		constraint ucode unique(Code),
    Name varchar(30) not null,
    Sales decimal(9,2) default 0 not null
		check (Sales >= 0), 
	Active bit not null default 1,
    Created datetime not null default current_timestamp
    );
    
Insert customers
	Values 
    (0, '0004', 'Jane', '2.00', 1, Current_timestamp),
    (0, '0005', 'Jon', '4.00', 0, Current_timestamp),
    (0, '0006', 'Bob', '5.50', 1, Current_Timestamp);
    
Select * from customers;

Create table Orders (
	ID int not null primary key auto_increment,
	Description varchar(30) not null,
	Total decimal(9,2) not null default 0,
    CustomerID int not null, 				-- referencing Foreign key
		foreign key (CustomerID)
		references customers(ID)    
);

Insert orders (Description, total, customerID)
	values
('Echo', 199.99, 2),
('Sweater', 35.99, 1),
('Facemasks', 49.99, 3);

Select * from orders;




/*
Create table product (									-- product table example
ID int not null primary key auto_increment,
Code varchar(10) not null unique,
Name varchar(30) not null,
Price decimal (9,0) not null default 0
	check (price >= 0),
    Active bit not null default 1,
    Created datetime not null default current_timestamp
    );
    */