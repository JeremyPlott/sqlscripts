
create database PRSdb;
go



/*
	select * from Users;
	select * from Vendors;
	select * from Products;
	select * from Requests;
	select * from RequestLines;
*/
----------------------------------------------------USER TABLE----------------------------------------------------
/*
select * from Users
*/
create table Users (
		Id int not null primary key identity(1,1),
		Username nvarchar(30) unique not null,
		Password nvarchar(30) not null,
		Firstname nvarchar(30) not null,
		Lastname nvarchar(30) not null,
		Phone nvarchar(12) null,
		Email nvarchar(255) null,
		IsReviewer bit default(1) not null,
		IsAdmin bit default(1) not null                   --everyone gets to be an admin :)
	);
go
insert into Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)
			values ('NotAGiraffe', 'password', 'Gordon', 'Ramsay', '123-456-7890', 'NotAGiraffe@safari.com', 1, 1);

insert into Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)
			values ('MrFrodo', 'shirelad', 'Frodo', 'Baggins', null, 'TheOneRing@mordor.com', 1, 1);

insert into Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)
			values ('Admin', 'sdffvihuerwvaadscs', 'James', 'Kirk', '098-765-4321', 'sdvskjnss@aol.com', 1, 0);
go

----------------------------------------------------VENDOR TABLE--------------------------------------------------
/*
select * from Vendors
*/
create table Vendors (
		Id int not null primary key identity(1,1),
		Code nvarchar(30) unique not null,
		Name nvarchar(30) not null,
		Address nvarchar(30) not null,
		City nvarchar(30) not null,
		State nchar(2) not null,
		Zip nchar(5) not null,
		Phone nvarchar(12) null,
		Email nvarchar(255) null,
	);
go
insert into Vendors (Code, Name, Address, City, State, Zip, Phone, Email)
			values ('DNRUS', 'Dinos-R-Us', '1525 Archaeology Ln.', 'Atlantis', 'OH', '45211', '144-236-7532', 'dustyhat@aol.com');

insert into Vendors (Code, Name, Address, City, State, Zip, Phone, Email)
			values ('GMACNDY', 'Grandmas Candy', '5832 Noveau Ct.', 'Berlin', 'FL', '94827', '111-222-3333', null);

insert into Vendors (Code, Name, Address, City, State, Zip, Phone, Email)
			values ('GPANY', 'Gold Plate Anything', 'AG47 Blvd.', 'Second', 'WA', '47474', '494-333-4827', '24k4lyfe@hotmail.com');
go

----------------------------------------------------PRODUCT TABLE-------------------------------------------------
/*
select * from Products
*/
create table Products (
		Id int not null primary key identity(1,1),
		PartNbr nvarchar(30) unique not null,
		Name nvarchar(30) not null,
		Price decimal(11,2) not null,
		Unit nvarchar(30) not null,
		PhotoPath nvarchar(255) null,    --Good idea to name the jpeg with the partnumber (unique)
		VendorId int foreign key references Vendors(Id) not null
	);
go
insert into Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)
			values (30372, 'Triceratops Horn', 879.01, '100', 'https://fskdjfhs/bit/imgur.com', 1);

insert into Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)
			values (01494, 'Werthers Originals', 0.02, '85574', null, 2);

insert into Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)
			values (46300, '24k Pl 10k', 19.99, '2', 'https://24kpl10.ebay.com', 3);
go

----------------------------------------------------REQUEST TABLE-------------------------------------------------
/*
select * from Requests
*/
create table Requests (
		Id int not null primary key identity(1,1),
		Description nvarchar(80) not null, 
		Justification nvarchar(80) not null,
		RejectionReason nvarchar(80) null default('-'),
		DeliveryMode nvarchar(20) not null default('Pickup'),
		Status nvarchar(10) not null default('NEW'),
		Total decimal(11,2) not null default(0),
		UserId int foreign key references Users(Id) not null
	);
go

insert into Requests (Description, Justification, RejectionReason, DeliveryMode, Status, Total, UserId)
			values ('Lots of dino bones', 'Ran out', null, default, default, 100, 1);

insert into Requests (Description, Justification, RejectionReason, DeliveryMode, Status, Total, UserId)
			values ('Candy', 'Candy', 'We already have candy', '-', 'REJ', 840, 3);

insert into Requests (Description, Justification, RejectionReason, DeliveryMode, Status, Total, UserId)
			values ('Dino Bones', 'Ran out again', null, 'Drone', 'APP', 34538, 2);
go

-----------------------------------------------REQUEST LINE TABLE-------------------------------------------------
/*
select * from RequestLines
*/
create table RequestLines (
		Id int not null primary key identity(1,1),
		RequestId int not null foreign key references Requests(Id),
		ProductId int not null foreign key references Products(Id),
		Quantity int not null default(1)
	);
go

insert into RequestLines (RequestId, ProductId, Quantity)
			values (1, 1, default);

insert into RequestLines (RequestId, ProductId, Quantity)
			values (2, 2, default);

insert into RequestLines (RequestId, ProductId, Quantity)
			values (3, 1, default);
go

/*
	select * from Users;
	select * from Vendors;
	select * from Products;
	select * from Requests;
	select * from RequestLines;
*/

--ADD THE CONSTRAINTS TO USER TABLE PHONE NUMBER FORMATTING
--ADD THE CONSTRAINTS TO REQUEST TABLE
--ADD THE CONSTRAINTS TO REQUESTLINE TABLE
--ADD VARIABLES