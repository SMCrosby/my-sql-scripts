Drop database if exists PRS;
Create database PRS;
use PRS;

Create table User (
	ID int not null primary key auto_increment,
    Username varchar(20) not null unique,
    Password varchar(10) not null,
    FirstName varchar(20) not null,
    LastName varchar(20) not null,
    PhoneNumber varchar(12) not null,
    Email varchar(75) not null,
    IsReviewer bit not null default 0,
    IsAdmin bit not null default 0
    
    );
    
Insert User (Username, Password, Firstname, lastname, phonenumber, email)
	Value
    ('SCrosby', '0000', 'Sarah', 'Crosby', '555-555-5555', 'SCrosby@gmail.com'),
    ('JDoe', '0000', 'Jane', 'Doe', '555-555-5555', 'JDoe@gmail.com'),
    ('GDoud', '0000', 'Greg', 'Doud', '555-555-5555', 'GDoud@gmail.com');
    
Select * from User;

Create table Vendor (
ID int not null primary key auto_increment,
Code Varchar(10) not null unique,
Name Varchar(255) not null,
Address varchar(255) not null,
City varchar(255) not null,
State varchar(2) not null,
Zip varchar(5) not null,
PhoneNumber varchar(12) not null,
Email varchar(100) not null
);

Insert vendor (Code, name, address, city, state, zip, phonenumber, email)
	Value
    ('1', 'Coke', '1234 Sycamore st', 'Cincinnati', 'OH', '45140', '555-555-5555', 'Coke@gmail.com'),
    ('2', 'Pepsi', '1234 Elk dr', 'Cincinnati', 'OH', '45140', '555-555-5555', 'Pepsi@gmail.com'),
    ('3', 'DrPepper', '1234 Porcupine ln', 'Cincinnati', 'OH', '45140', '555-555-5555', 'DrPepper@gmail.com');
    
Select * from Vendor;
    
Create table Product (
	ID int not null primary key Auto_increment,
    VendorID int not null,
		foreign key (VendorID)
        references Vendor(ID),
	PartNumber Varchar(50) not null,
		Constraint vendor_part unique(VendorID, PartNumber),   -- Makes it so each vendor id and part number combo is unique
    Name varchar(150) not null,
    Price Decimal(10,2) not null,
    Unit Varchar(255),
    PhotoPath Varchar(255)
    );
    
Insert Product (vendorid, Partnumber, name, price, unit, photopath)
	Value
	('1','1', 'Valve - Small', '5.99', '2', 'https.valves.com'),
	('2','2', 'Valve - Medium', '8.99', '2', 'https.valves.com'),
	('3','3', 'Valve - Large', '14.99', '2', 'https.valves.com');
        
Select * from Product;
    
Create table Request (
ID int not null primary key auto_increment,
UserID int not null,
	Foreign key(UserID)
    references User(ID),
Description Varchar(100) not null, 			-- what the request is for/about
Justification varchar(255) not null,		-- why you think you need it
DateNeeded datetime default Current_timestamp,
DeliveryMode varchar(25) not null,
Status Varchar(20) not null default 'New',
Total decimal (10,2) not null default 0,
SubmittedDate datetime not null default current_timestamp,
ReasonForRejection varchar(100)
);

Insert Request (UserID, description, justification, deliverymode, total)
	Values
    ('1', 'Buying new chair', 'Office chair broke', 'FedEX', 75.99),
	('2', 'Looking to buy a stand up desk', 'Looking to buy a stand up desk due to back problems', 'Amazon', 259.99),
	('3', 'Need to buy more pens', 'Office supply of pens is running low', 'FedEX', 50.99);
    
Select * from request;
	
Create table LineItem (
ID int not null primary key auto_increment,
RequestID int not null,
	foreign key (requestID)
    references request(ID),
ProductID int not null,
	foreign key(ProductID)
    references product(ID),
Quantity int not null default 1
);

Select * from LineItem;
	

    


    
    