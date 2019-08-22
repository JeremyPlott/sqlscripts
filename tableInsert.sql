/*
insert into TechTrack 
			(Id, Description, NbrOfWeeks, Available)
	values ('DNET', 'Dot Net', 12, 1)

insert into TechTrack 
			(Id, Description, NbrOfWeeks, Available)
	values ('JAVA', 'Java', 12, 1)

insert into TechTrack 
			(Id, Description, NbrOfWeeks, Available)
	values ('NWSC', 'Network Security', 8, 1)
*/

/*
insert into Developers
			(Id, Firstname, Lastname, PrimaryEmail, SecondaryEmail, Phone, City, State, TechTrackId)
	values (8, 'Lidya', 'Tsegay', 'lidya@...', null, '513-555-5555', 'Cincinnati', 'OH', 'DNET')

insert into Developers
			(Id, Firstname, Lastname, PrimaryEmail, SecondaryEmail, Phone, City, State, TechTrackId)
	values (12, 'Justin', 'Dudley', 'justin@...', null, '513-555-5555', 'Cincinnati', 'OH', 'DNET')

insert into Developers
			(Id, Firstname, Lastname, PrimaryEmail, SecondaryEmail, Phone, City, State, TechTrackId)
	values (17, 'Tricia', 'Good', 'tricia@...', null, '513-555-5555', 'Cincinnati', 'OH', 'DNET')
*/

--joinview to show first, last, program name

/*
insert into TechTopics (Description) values ('Git/GitHub');
insert into TechTopics (Description) values ('SQL Server');
insert into TechTopics (Description) values ('C#');
insert into TechTopics (Description) values ('EntityFramework');
insert into TechTopics (Description) values ('WebApi');
insert into TechTopics (Description) values ('MVC');
insert into TechTopics (Description) values ('HTML');
insert into TechTopics (Description) values ('CSS');
insert into TechTopics (Description) values ('JavaScript');
insert into TechTopics (Description) values ('Bootstrap');
insert into TechTopics (Description) values ('jQuery');
insert into TechTopics (Description) values ('Typescript');
insert into TechTopics (Description) values ('Angular');
--Java
insert into TechTopics (Description) values ('MySQL');
insert into TechTopics (Description) values ('Java');
insert into TechTopics (Description) values ('Hibernate');
insert into TechTopics (Description) values ('Spring');
insert into TechTopics (Description) values ('JPA');
*/

/*
--using select statement to populate a parameter
declare @GitGithubId int; 
select  @GitGithubId = Id from TechTopics where Description = 'Git/Github';

insert into TechTrackTopics (TechTrackId, TechTopicsId) values ('DNET', @GitGithubId);
insert into TechTrackTopics (TechTrackId, TechTopicsId) values ('JAVA', @GitGithubId);

declare @SQLserverId int
select  @SQLserverId = id from TechTopics where description = 'SQL Server';

insert into TechTrackTopics (TechTrackId, TechTopicsId) values ('DNET', @SQLserverId);
*/
/*
select TechTrack Description, TechTopics.Id
	from TechTopics
	join TechTrackTopics
		on TechTrack.id = TechTrackTopicsId
	join TechTrack
		on TechTrack.Id = TechTrackTopics
	order by TechTopics.description
*/


drop table if exists Contacts;
go
create table Contacts (
	Id int not null primary key identity(1,1),
	FirstName nvarchar(30) not null,
	LastName nvarchar(30) null,
	Phone nvarchar(20) not null,
	Email nvarchar(255) null,
	Address nvarchar(255) null,
	Relationship nvarchar(255) not null,
	City nvarchar(50) null,
	State nvarchar(50) null,
	Birthday datetime null,
	FavColor nvarchar(80) null,
	Notes nvarchar(500) null
);
go
insert into Contacts 
				(FirstName, LastName, Phone, Email, Address, Relationship, 
				City, state, Birthday, FavColor, Notes)
		values ('James', 'Bond', '007-007-0007', 'DefinitelyNotJamesBond@co.uk', null, 'Work Acquaintance', 
				'England', null, null, 'Gold', 'Says he isnt related to MI6');

insert into Contacts 
				(FirstName, LastName, Phone, Email, Address, Relationship, 
				City, state, Birthday, FavColor, Notes)
		values ('Samuel', 'Jackson', '000-000-0000', 'TastyBurger@aol.com', 'Im not telling you that', 'Once yelled at me', 
				'Hollywood', 'CA', 1900-01-01, 'Dark blue', 'Really likes cats');

insert into Contacts 
				(FirstName, LastName, Phone, Email, Address, Relationship, 
				City, state, Birthday, FavColor, Notes)
		values ('Hans', 'Zimmer', '999-999-9999', 'hanz@us.gov', 'Remote Control Studio', 'Client', 
				'Hollywood', 'CA', 1721-10-31, 'Concert black', 'Always in search of more basses');

go
select * from Contacts
go


/* Alter columns in table
go
alter table Contacts
	add BFF bit default 0;

go
alter table Contacts
	alter column Address nvarchar(80);

go
alter table Contacts
	drop contraint [DF__Contacts__Favori__66603565]; 

go
alter table contacts
	drop column BFF;
