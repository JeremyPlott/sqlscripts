/*
ALTER PROCEDURE ListStudentsByName as
BEGIN
select Student.Id, 
	concat(Student.Lastname, ', ', Student.Firstname) 'Name', 
	Student.GPA, 
	Student.SAT, 
	isnull(Major.Description, 'Undeclared') 'Major'

		from Student
		left join major
			on Student.MajorId = Major.Id

order by Name
END
go

exec ListStudentsByName;
go
*/

ALTER PROCEDURE ListStudentsWithinGPA 
	@LowGPA  decimal(4,2) = 0,				--Parameters. Passed in to procedure. Declared here.
	@HighGPA decimal(4,2) = 5					--Variables. Declared inside script. The = acts as a default value.
AS

BEGIN
select Student.Id, 
	concat(Student.Lastname, ', ', Student.Firstname) 'Name', 
	Student.GPA, 
	Student.SAT, 
	isnull(Major.Description, 'Undeclared') 'Major'

		from Student
		left join major
			on Student.MajorId = Major.Id
				
	where Student.GPA between @LowGPA and @HighGPA			--between means order doesn't matter. Inclusive.

order by Name

END
go

exec ListStudentsWithinGPA				--It's possible to just provide the values instead of using the @ here.
					@LowGPA  = 2.5, 
					@HighGPA = 3.0;
go