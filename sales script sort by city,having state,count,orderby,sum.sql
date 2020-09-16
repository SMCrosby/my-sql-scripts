select city, sum(sales)  -- Shows columns city and the sum of sales
	from Customers
    group by city,state -- Seperates the Sum of sales by specific cities
    having sum(sales) > 600000
    
-- having city = 'Cincinnati' or city = 'Columbus';   -- Way to show only Cinncinnati or Columbus data
-- having city in ('Cincinnati', 'Columbus);  --Another way to only show cincinnati or columbus data
-- having state = 'OH'    -- Where state is Ohio
-- Select count(id) from Customers   -- Counts # of rows in column(id) from Customer table
-- Select count(*) from Customers   -- Counts # of rows in all columns from customer table
-- order by  -- last command to make when selecting data