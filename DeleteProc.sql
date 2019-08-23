CREATE PROCEDURE DeleteUser
	@Username nvarchar(30)
AS

BEGIN
	DECLARE @Id int;

	IF NOT EXISTS (SELECT * from Users where Username = @Username)
		BEGIN
			Print 'No user with username of ' + @Username + 'exists.'
		END

	SELECT @Id = Id from Users 
					where Username = @Username


	DELETE from Users
				where id = @Id

	if @@rowcount != 1
	BEGIN
		print 'The delete failed';
		return;
	END

	Print 'The delete was successful :)';
END
go

exec DeleteUser 
		@Username   = 'ihaveenoughletters'
go