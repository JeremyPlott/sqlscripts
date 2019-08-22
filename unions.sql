select 'Green' Color, * from student

	where GPA >= 3.0

UNION

select 'Blue' Color, * from student

	where GPA >= 2.5 and GPA < 3.0

UNION

select 'Orange' Color, * from student

	where GPA < 2.5

order by GPA desc