--Show all majors, and the classes required for each

/*
select *
from major, class, MajorClassRel
order by majorclassrel.MajorId
*/

select
	major.Description,
	class.Subject,
	class.Section

		from major
		join MajorClassRel
			on MajorClassRel.MajorId = major.id
		join class
			on class.id = MajorClassRel.classid

	order by major.Description