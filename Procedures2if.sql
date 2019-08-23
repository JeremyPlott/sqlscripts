ALTER PROCEDURE ChangeUser
	@Username nvarchar(30),
	@Password nvarchar(30),
	@Firstname nvarchar(30),
	@Lastname nvarchar(30),
	@Phone nvarchar(12),				 --set the default with '= null'
	@Email nvarchar(255),
	@IsReviewer bit,
	@IsAdmin bit
AS

BEGIN
	DECLARE @Id int;

	IF NOT EXISTS (SELECT * from Users where Username = @Username)
		BEGIN
			Print 'No user with username of ' + @Username + 'exists.'
		END

	SELECT @Id = Id from Users 
							where Username = @Username


	UPDATE Users Set
			Username   = @Username,
			Password   = @Password,
			Firstname  = @Firstname,
			Lastname   = @Lastname,
			Phone      = @Phone,
			Email      = @Email,
			IsReviewer = @IsReviewer,
			IsAdmin    = @IsAdmin
		where id = @Id

	if @@rowcount != 1
	BEGIN
		print 'The insert failed';
		return;
	END

	Print 'The insert was successful :)';
END
go

exec ChangeUser 
		@Username   = 'ihaveenoughletters',
		@Password   = 'password',
		@Firstname  = 'Aeiouy',
		@Lastname   = 'Qwert',
		@Phone      = null,
		@Email      = null,
		@IsReviewer = 1,
		@IsAdmin    = 1
go