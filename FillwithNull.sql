/*
** To execute this procedure, call it and pass the primary
** key in the @pid parameter. Then pass any other data in
** that you want to change in the appopriate parameter.
**
** The procedure first reads the row to be changed. Then, 
** the series of 'if' statements sets any property passed
** in to the new value. Any parameter not changes will 
** remain null and the value read from the database will
** be passed to that value.
*/
USE [PRSDB7]
GO
/****** Object:  StoredProcedure [dbo].[ChangeUser2]    Script Date: 8/24/2019 4:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[ChangeUser2] 
	@pid int,
	@pusername nvarchar(30) = null,
	@ppassword nvarchar(30) = null,
	@pfirstname nvarchar(30) = null,
	@plastname nvarchar(30) = null,
	@pphone nvarchar(12) = null,
	@pemail nvarchar(255) = null,
	@pisReviewer bit = null,
	@pisAdmin bit = null
as
begin
	declare @id int, @username nvarchar(30), @password nvarchar(30);
	declare @firstname nvarchar(30), @lastname nvarchar(30)
	declare @phone nvarchar(12), @email nvarchar(255)
	declare @isReviewer bit, @isAdmin bit
	-- read the current user
	SELECT
		@id = Id,
		@username = Username,
		@password = Password,
		@firstname = Firstname,
		@lastname = Lastname,
		@phone = Phone,
		@email = Email,
		@isReviewer = IsReviewer,
		@isAdmin = IsAdmin
		from Users
		where Id = @pid;
​
	if @pusername is not null set @username = @pusername;
	if @ppassword is not null set @password = @ppassword;
	if @pfirstname is not null set @firstname = @pfirstname;
	if @plastname is not null set @lastname = @plastname;
	if @pphone is not null set @phone = @pphone;
	if @pemail is not null set @email = @pemail;
	if @pisReviewer is not null set @isReviewer = @pisReviewer;
	if @pisAdmin is not null set @isAdmin = @pisAdmin;
​
	UPDATE Users Set
		Username = @username,
		Password = @password,
		Firstname = @firstname,
		Lastname = @lastname,
		Phone = @phone,
		Email = @email,
		IsReviewer = @isReviewer,
		IsAdmin = @isAdmin
		where Id = @id;
​
	if @@ROWCOUNT != 1
	begin
		Print 'Update failed!';
		Return -1;
	end
​
	Print 'Update successful.';
​
end