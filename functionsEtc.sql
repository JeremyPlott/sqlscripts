/*
select *
	from student
	join major
		on student.MajorId = major.id

*/

---------------------------------------------------------------------------------------------------

/*
select 
	student.firstname 'First Name', 
	student.lastname 'Last Name', 
	student.GPA, 
	student.SAT,
	isnull(major.description,'Undeclared') 'Major'


	from student
	left join major

		on student.majorid = major.id


	order by description desc, lastname
*/

---------------------------------------------------------------------------------------------------

/*
--Built-in SQL functions
Select 
	count(id) 'Students',                --count(*) is the more common command
	count(majorid) 'Declared Students',
	max(SAT) 'Max SAT',
	min(SAT) 'Min SAT',
	avg(GPA) 'Avg GPA'

	from Student
*/