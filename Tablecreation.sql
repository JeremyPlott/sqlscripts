/*
create database Apprenti;
*/


/*
create table TechTrack (
	Id nchar(4) not null primary key,
	Description nvarchar(30) not null,
	NbrOfWeeks int not null,
	Available bit not null 
);
*/

/*
create table Developers (
	Id int not null primary key, --identity(x,y) for SQL auto-gen PK
	Firstname nvarchar(30) not null,
	Lastname nvarchar(30) not null,
	PrimaryEmail nvarchar(255) not null,
	SecondaryEmail nvarchar(255) null,
	Phone nvarchar(25) null,
	City nvarchar(50) not null,
	State nchar(2) not null,
	Active bit not null default 1,
	TechTrackId nchar(4) not null foreign key references TechTrack(Id)
);
*/

/*
create table TechTopics (
	Id int not null primary key identity(1,1),
	Description nvarchar(80) not null
);
*/

/*
create table TechTrackTopics (
	Id int not null primary key identity(1,1),
	TechTrackId nchar(4) not null foreign key references TechTrack(Id),
	TechTopicsId int not null foreign key references TechTopics(Id)
);
*/

/*
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
*/