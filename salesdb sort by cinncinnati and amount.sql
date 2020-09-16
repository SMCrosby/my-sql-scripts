select * 
from customers
	where city = 'cincinnati' 
    and sales >= 30000 and sales < 40000
	order by sales desc