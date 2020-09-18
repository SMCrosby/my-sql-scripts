select description as 'Major', count(*) as 'Classes Required'  -- can also use count(description)
	from major m
    join majorclassrel mc
		on m.id = mc.MajorId
	join class c
		on mc.classid = c.id
	group by m.description
    having count(*) > 10    -- having works on group data
     
    