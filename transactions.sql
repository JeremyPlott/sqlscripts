begin transaction

	insert into Student (id, Firstname, Lastname, SAT, GPA, MajorId)
				values (999, 'Jane', 'Doe', 2400, 2.1, null)

							if @@ROWCOUNT <> 1 
							BEGIN
								rollback transaction
							END

	insert into Student (id, Firstname, Lastname, SAT, GPA, MajorId)
				values (998, 'John', 'Smith', 600, 4.0, 999) --designed to fail with FK number

							if @@ROWCOUNT <> 1 
							BEGIN
								rollback transaction
							END

commit transaction

/*
select * from student where id in (998, 999)

delete from student where id = 998
*/