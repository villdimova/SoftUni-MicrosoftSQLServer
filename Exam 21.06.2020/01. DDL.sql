CREATE DATABASE TripService

USE TripService

CREATE TABLE Cities 
(
	Id INT PRIMARY KEY	IDENTITY,
	[Name] NVARCHAR(20) NOT NULL,
	CountryCode NVARCHAR(2)  NOT NULL
)


CREATE TABLE Hotels
(
	Id INT PRIMARY KEY	IDENTITY,
	[Name] NVARCHAR(30) NOT NULL,
	CityId INT NOT NULL REFERENCES Cities(Id),
	EmployeeCount INT NOT NULL,
	BaseRate DECIMAL(15,2)

)
CREATE TABLE Rooms
(
	Id INT PRIMARY KEY	IDENTITY,
	Price DECIMAL (15,2) NOT NULL,
	[Type] NVARCHAR(20) NOT NULL,
	Beds INT NOT NULL,
	HotelId INT NOT NULL REFERENCES Hotels(Id)

)
CREATE TABLE Trips
(
	Id INT PRIMARY KEY IDENTITY, 
	RoomId INT NOT NULL REFERENCES Rooms(Id),
	BookDate DATE NOT NULL,
	CONSTRAINT ck_validBookDate CHECK(BookDate<ArrivalDate),
	ArrivalDate DATE NOT NULL,
	CONSTRAINT ck_validArrivalDate CHECK(ArrivalDate<ReturnDate),
	ReturnDate DATE NOT NULL, 
	CancelDate DATE

)

CREATE TABLE Accounts
(
	Id INT PRIMARY KEY IDENTITY, 
	FirstName NVARCHAR(50) NOT NULL,
	MiddleName NVARCHAR(20),
	LastName NVARCHAR(50) NOT NULL,
	CityId INT NOT NULL REFERENCES Cities(Id),
	BirthDate DATE NOT NULL,
	Email NVARCHAR(100) NOT NULL UNIQUE


)
CREATE TABLE AccountsTrips
(
	AccountId INT NOT NULL REFERENCES Accounts(Id), 
	TripId INT NOT NULL REFERENCES Trips(Id),
	Luggage INT NOT NULL CHECK(Luggage>=0)
	CONSTRAINT pk_AccountsTrips
	PRIMARY KEY(AccountId,TripId)

)

