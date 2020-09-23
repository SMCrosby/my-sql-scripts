/*
Select r.description, r.deliverymode, r.status, r.total, p.name, p.price, l.quantity, 
(p.price * l.quantity) as 'Subtotal',  							-- Shows a subtotal from price * quantity
concat(u.firstname,' ', u.lastname) as Name, u.phonenumber 		 -- joins first and last name into one column
*/
select r.description, sum(l.quantity * p.price) as 'Total'  -- shows just the description and the total price (# x $), must group by r.description after joins
From Request r
	left join lineitem l
    on l.requestID = r.ID
    
    left Join Product p
    on p.ID = l.ProductID
    
    Left join vendor v
    on v.ID = p.VendorID
    
    left join user u
    on u.ID = r.UserID
    
    group by r.description
    