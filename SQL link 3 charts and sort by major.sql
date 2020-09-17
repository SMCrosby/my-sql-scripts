select m.description as 'major', c.section, c.subject  -- only lists discription(named major), class section, and class subject
	from major m 
	join majorclassrel mc
	on m.id = mc.majorid
	
    join class c 
	on c.id = mc.classid

where m.description = 'general business'  -- only show people with the general bussiness major