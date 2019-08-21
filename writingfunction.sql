declare @LowSAT int;
declare @HighSAT int;

set @LowSAT  = 1000;
set @HighSAT = 1400;


select 
	*

	from student

		--where student.SAT >= 1000 and student.SAT <= 1300
		where student.SAT <  @LowSAT or  student.SAT >  @HighSAT


	
	order by student.SAT desc, student.lastname
