CREATE DATABASE Bakery

USE Bakery

CREATE TABLE Countries
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(50) NOT NULL, 

)

CREATE TABLE Customers
(
	Id INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(25) NOT NULL,
	LastName NVARCHAR(25) NOT NULL,
	Gender CHAR(1) CHECK (Gender IN ('M','F')) NOT NULL,
	Age INT NOT NULL,
	PhoneNumber CHAR(10) NOT NULL CHECK(
	LEN(PhoneNumber)=10),
	CountryId INT NOT NULL REFERENCES Countries(Id)
)
CREATE TABLE Products
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(25) UNIQUE NOT NULL,
	[Description] NVARCHAR(250) NOT NULL, 
	Recipe NVARCHAR(MAX) NOT NULL,
	Price MONEY NOT NULL CHECK(Price>0) 

)
CREATE TABLE Feedbacks
(
	Id INT PRIMARY KEY IDENTITY,
	[Description] NVARCHAR(255), 
	Rate DECIMAL(4,2) CHECK(Rate>0 AND Rate<10) NOT NULL,
	ProductId INT NOT NULL REFERENCES Products(Id),
	CustomerId INT NOT NULL REFERENCES Customers(Id)

)
CREATE TABLE Distributors
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(25) NOT NULL UNIQUE,
	AddressText NVARCHAR(30) NOT NULL, 
	Summary  NVARCHAR(200) NOT NULL,
	CountryId INT NOT NULL REFERENCES Countries(Id) 

)
CREATE TABLE Ingredients
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(30) NOT NULL,
	[Description] NVARCHAR(200) NOT NULL,
	OriginCountryId INT NOT NULL REFERENCES Countries(Id),
	DistributorId INT NOT NULL REFERENCES Distributors(Id)

)
CREATE TABLE ProductsIngredients
(
	ProductId INT NOT NULL REFERENCES Products(Id),
	IngredientId INT NOT NULL REFERENCES Ingredients(Id),
	CONSTRAINT pk_ProductsIngredients PRIMARY KEY(ProductId,IngredientId)
)