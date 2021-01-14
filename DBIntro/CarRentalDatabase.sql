CREATE DATABASE CarRental

--•	Categories (Id, CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
CREATE TABLE Categories
(
	Id INT PRIMARY KEY,
	CategoryName NVARCHAR(30) NOT NULL,
	DailyRate DECIMAL(15,2),
	WeeklyRate DECIMAL(15,2),
	MonthlyRate DECIMAL(15,2) NOT NULL,
	WeekendRate DECIMAL(15,2)

)

INSERT INTO Categories(Id, CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
VALUES
(2,'Family', 36.80, 200.95, 285.64,NULL),
(3,'Luxury', 75.80, 450.95, 679.64,NULL),
(1,'Sport', 55.80, 300.95, 482.64,NULL)
--•	Cars (Id, PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available)

CREATE TABLE Cars
(
	Id INT PRIMARY KEY,
	PlateNumber INT NOT NULL,
	Manufacturer NVARCHAR(30) NOT NULL,
	Model NVARCHAR(30) NOT NULL,
	CarYear VARCHAR(4) NOT NULL,
	CategoryId INT NOT NULL,
	Doors TINYINT NOT NULL,
	Picture IMAGE,
	Condition NVARCHAR(100),
	Available NVARCHAR(20) NOT NULL,

)

INSERT INTO Cars (Id, PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available)
VALUES
(1, 28,'Subaru', 'Legacy', 2010, 2, 4, NULL,NULL, 'Available'),
(2, 24,'Porshe', 'Boxter', 2018, 2, 2, NULL,NULL, 'Not available'),
(3, 21,'Porshe', 'Cayman', 2021, 2, 4, NULL,NULL, 'In delivery')


--•	Employees (Id, FirstName, LastName, Title, Notes)
CREATE TABLE Employees 
(	
	Id INT PRIMARY KEY, 
	FirstName NVARCHAR(30) NOT NULL,
	LastName NVARCHAR(30) NOT NULL, 
	Title NVARCHAR(20) NOT NULL, 
	Notes NVARCHAR(MAX) 
)

INSERT INTO Employees (Id, FirstName, LastName, Title, Notes)
VALUES
(1,'Ivan', 'Ivanov', 'CEO', NULL),
(2,'Peter', 'Petrov', 'CTO', NULL),
(3,'Marin', 'Marinov', 'CFO', NULL)

--•	Customers (Id, DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes)
CREATE TABLE Customers 
(	
	Id INT PRIMARY KEY NOT NULL, 
	DriverLicenceNumber INT NOT NULL,	
	FullName NVARCHAR(50) NOT NULL, 
	[Address] NVARCHAR(80) NOT NULL, 
	City NVARCHAR(20) NOT NULL, 
	ZIPCode NVARCHAR(10) NOT NULL, 
	Notes NVARCHAR(MAX)
)

INSERT INTO Customers (Id, DriverLicenceNumber, FullName, [Address], City, ZIPCode, Notes)
VALUES
(1, 26564, 'Ivaylo Penev', 'str.Svetlina 56', 'Russe', '7000', NULL ),
(2, 56926, 'Martin Petrov', 'str.Tulcha 56', 'Russe', '7000', NULL ),
(3, 26564, 'Ana Peneva', 'str.Borisova 56', 'Russe', '7000', NULL )
--•	RentalOrders (Id, EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes)

CREATE TABLE RentalOrders
(
	Id INT PRIMARY KEY, 
	EmployeeId INT NOT NULL, 
	CustomerId INT NOT NULL, 
	CarId INT NOT NULL, 
	TankLevel INT NOT NULL, 
	KilometrageStart INT NOT NULL, 
	KilometrageEnd INT NOT NULL, 
	TotalKilometrage INT NOT NULL, 
	StartDate DATE NOT NULL, 
	EndDate DATE NOT NULL, 
	TotalDays INT NOT NULL, 
	RateApplied INT NOT NULL, 
	TaxRate INT, 
	OrderStatus NVARCHAR(50), 
	Notes NVARCHAR(MAX)
)

INSERT INTO RentalOrders(Id, EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes)
VALUES
(26,2,1,3,90,8000,9500, 1500,'05/08/2020', '05/18/2020',10, 5, NULL,NULL,NULL ),
(35,1,2,2,120,21000,25000, 4000,'05/08/2020', '05/28/2020',20, 7, NULL,NULL,NULL ),
(41,3,1,1,100,17000,20000, 3000,'05/08/2020', '06/08/2020',30, 4, NULL,NULL,NULL )
