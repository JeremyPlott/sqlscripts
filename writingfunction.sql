-------------------------------------------ASSIGN PARAMETERS---------------------------------------

declare @LowSAT int;
declare @HighSAT int;
declare @LowGPA decimal(4,2);


set @LowSAT  = 1000;
set @HighSAT = 1400;
set @LowGPA  = 2.7;

-------------------------------------------------CODE----------------------------------------------

select 
	--*
	avg(SAT) 'Avg SAT'

	from student

		--where student.SAT >= 1000 and student.SAT <= 1300
		--where student.SAT <  @LowSAT or student.SAT > @HighSAT
		--where student.GPA >= @LowGPA
		

	
	--order by student.SAT desc, student.lastname
