select * 
	from orders o
    join Orderlines ol
		on o.Id = ol.OrdersId
	join customers c			
		on o.customerid = c.id
/*
select *
	from orders o
    join Orderlines l
		on o.id = l.ordersid
	join customers c
		on c.id = o.customerid
	*/
        

