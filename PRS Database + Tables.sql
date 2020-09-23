Drop database if exists PRS;
Create database PRS;
use PRS;

Create table User (
	ID 				int not null primary key auto_increment,
    Username 		varchar(20) 	not null 	unique,
    Password 		varchar(10) 	not null,
    FirstName 		varchar(20)		not null,
    LastName 		varchar(20) 	not null,
    PhoneNumber 	varchar(12) 	not null,
    Email 			varchar(75) 	not null,
    IsReviewer 		bit 			not null 	default 0,
    IsAdmin 		bit 			not null 	default 0
    
    );
    
Insert User (Username, Password, Firstname, lastname, phonenumber, email)
	Value
    ('SCrosby', '0000', 'Sarah', 'Crosby', '555-555-5555', 'SCrosby@gmail.com'),
    ('JDoe', '0000', 'Jane', 'Doe', '555-555-5555', 'JDoe@gmail.com'),
    ('GDoud', '0000', 'Greg', 'Doud', '555-555-5555', 'GDoud@gmail.com'),
    ('BBolt', '0000', 'Brandon', 'Bolt', '555-555-5555', 'BBolt@gmail.com'),
    ('JHall', '0000', 'Josh', 'Hall', '555-555-5555', 'JHall@gmail.com');
    
Select * from User;

Create table Vendor (
ID 				int 				not null 	primary key auto_increment,
Code 			varchar(10) 		not null 	unique,
Name 			varchar(255) 		not null,
Address 		varchar(255) 		not null,
City 			varchar(255) 		not null,
State 			varchar(2) 			not null,
Zip 			varchar(5) 			not null,
PhoneNumber 	varchar(12) 		not null,
Email 			varchar(100) 		not null
);

Insert vendor (Code, name, address, city, state, zip, phonenumber, email)
	Value
    ('1', 'Amazon', '1234 Sycamore St', 'Cincinnati', 'OH', '45140', '555-555-5555', 'Amazon@gmail.com'),
    ('2', 'Wal-Mart', '1234 Elk Dr', 'Cincinnati', 'OH', '45140', '555-555-5555', 'Wal-Mart@gmail.com'),
    ('3', 'Meijer', '1234 Porcupine Ln', 'Cincinnati', 'OH', '45140', '555-555-5555', 'Meijer@gmail.com'),
    ('4', 'Target', '1234 Shark St', 'Cincinnati', 'OH', '45140', '555-555-5555', 'Target@gmail.com'),
    ('5', 'Costco', '1234 Lion St', 'Cincinnati', 'OH', '45140', '555-555-5555', 'Costco@gmail.com');
    
Select * from Vendor;
    
Create table Product (
	ID 			int 			not null 	primary key Auto_increment,
    VendorID 	int 			not null,
	PartNumber 	varchar(50) 	not null,
	Name 		varchar(150) 	not null,
    Price 		decimal(10,2) 	not null,
    Unit 		varchar(255),
    PhotoPath 	varchar(255),
    foreign key (VendorID) references vendor(ID),
    Constraint vendor_part unique(VendorID, PartNumber)   -- Makes it so each vendor id and part number combo is unique
    );
    
Insert Product (vendorid, Partnumber, name, price, unit, photopath)
	Value
	('1','1', 'Office Chair', '59.99', '1', 'https.Chairs.com'),
	('2','2', 'Amazon Echo', '89.99', '1', 'https.Amazon-Products.com'),
	('3','3', 'Masks', '14.99', '5', 'https.PPE/Face.com'),
    ('4','4', 'Hp Laptop', '1289.99', '1', 'https.Hp/Laptops.com'),
    ('5','5', 'Standing Desk', '289.99', '1', 'https.Costco.com'),
    ('5','6', 'Pens', '9.99', '20', 'https.Wal-Mart.com');
        
Select * from Product;
    
Create table Request (
ID 					int 			not null 	primary key auto_increment,
UserID 				int 			not null,
Description 		varchar(100) 	not null, 						-- what the request is for/about
Justification 		varchar(255) 	not null,						-- why you think you need it
DateNeeded 			datetime 					default Current_timestamp,
DeliveryMode 		varchar(25) 	not null,
Status 				varchar(20) 	not null 	default 'New',
Total 				decimal (10,2)	not null 	default 0,
SubmittedDate 		datetime 		not null 	default current_timestamp,
ReasonForRejection 	varchar(100),

Foreign key(UserID) references User(ID)
);

Insert Request (UserID, description, justification, deliverymode, total)
	Values
    ('1', 'New computer chair', 'Office chair broke', 'Wal-Mart', 59.99),
	('2', 'Stand up desk', 'Back problems', 'Amazon', 259.99),
	('3', 'Pens', 'Low on Pens', 'Wal-Mart', 9.99);
    
Select * from request;
	
Create table LineItem (
ID 				int 		not null 	primary key auto_increment,
RequestID 		int 		not null,
ProductID 		int 		not null,
Quantity 		int 		not null 	default 1,
foreign key (requestID) references request(ID),
foreign key(ProductID) references product(ID),
Constraint request_product unique (RequestID, ProductID)	   -- Makes it so each Request/Product combo is unique
);

Insert LineItem (Requestid, ProductID, quantity)
	Values
    (1, 1, 2),
    (1, 2, 1),
    (1, 3, 5),
    (2, 1, 1),
    (2, 3, 2);
    
Select * from LineItem;

Drop user if exists prs_user@localhost;
Create user prs_user@localhost identified by 'sesame';
grant select, insert, update, delete, update on prs.* to prs_user@localhost;

