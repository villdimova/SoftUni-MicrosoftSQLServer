
CREATE DATABASE	Hotel	

--•	Employees (Id, FirstName, LastName, Title, Notes)
CREATE TABLE Employees
(	Id INT PRIMARY KEY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Title NVARCHAR(40) NOT NULL,
	Notes NVARCHAR(MAX)
)

INSERT INTO Employees(Id,FirstName, LastName, Title, Notes)
VALUES
(1, 'Tanya', 'Petrova', 'Chef', 'best'),
(2, 'Peter', 'Ivanov', 'CEO', 'best'),
(3, 'Maria', 'Arnaudova', 'Cleaner', NULL)
--•	Customers (AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
CREATE TABLE Customers
(	
	AccountNumber INT PRIMARY KEY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	PhoneNumber VARCHAR(20), 
	EmergencyName NVARCHAR(50) NOT NULL,
	EmergencyNumber VARCHAR(20) NOT NULL,
	Notes NVARCHAR(MAX)
)
INSERT INTO Customers(AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
VALUES
(91, 'Martina', 'Petrova', '1236598', 'Peter', '1258455',NUll),
(92, 'Ivan', 'Ivanov', '2654515', 'Marti', '48545855',NUll),
(93, 'Katy', 'Simeonova', '565654654', 'Ana', '56556544',NUll)

--•	RoomStatus (RoomStatus, Notes)
CREATE TABLE RoomStatus
(	
	RoomStatus NVARCHAR(20) NOT NULL,
	Notes NVARCHAR(MAX)
)
INSERT INTO RoomStatus(RoomStatus, Notes)
VALUES
('occupied', NULL),
('free',NULL),
('cleaning',NULL)


--•	RoomTypes (RoomType, Notes)
CREATE TABLE RoomTypes
(	
	RoomType VARCHAR(20) NOT NULL,
	Notes NVARCHAR(MAX)
)

INSERT INTO RoomTypes(RoomType, Notes)
VALUES
('one bedroom', NULL),
('two bedroom', NULL),
('apartment', NULL)

--•	BedTypes (BedType, Notes)
CREATE TABLE BedTypes
(	
	BedType VARCHAR(20) NOT NULL,
	Notes NVARCHAR(MAX)
)
INSERT INTO BedTypes (BedType, Notes)
VALUES
('onesize', NULL),
('doublesize', NULL),
('three single beds', NULL)

--•	Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
CREATE TABLE Rooms
(	
	RoomNumber INT PRIMARY KEY,
	RoomType VARCHAR(20) NOT NULL,
	BedType VARCHAR(20) NOT NULL,
	Rate INT,
	RoomStatus NVARCHAR(20) NOT NULL,
	Notes NVARCHAR(MAX)
)
INSERT INTO Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
VALUES
(128,'one bedroom','onesize',8, 'cleaning', NULL),
(254,'two bedroom','three single beds',8, 'free', NULL),
(302,'apartment','doublesize',8, 'occupied', NULL)
--•	Payments (Id, EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, 
--TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)

CREATE TABLE Payments
(	
	Id INT PRIMARY KEY,
	EmployeeId INT NOT NULL,
	PaymentDate DATETIME NOT NULL,
	AccountNumber INT NOT NULL,
	FirstDateOccupied DATETIME NOT NULL,
	LastDateOccupied DATETIME NOT NULL,
	TotalDays INT NOT NULL,
	AmountCharged DECIMAL(15,2) NOT NULL,
	TaxRate INT NOT NULL,
	TaxAmount INT NOT NULL,
	PaymentTotal DECIMAL(15,2) NOT NULL,
	Notes NVARCHAR(MAX)
)
INSERT INTO Payments (Id, EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)
VALUES
(1,2,GETDATE(), 91, '3/2/2020', '3/8/2020', 5, 752.36, 10, 5, 767.36, NULL), 
(2,2,GETDATE(), 92, '2/1/2020', '2/6/2020', 5, 752.36, 10, 5, 767.36, NULL),
(3,2,GETDATE(), 93, '8/10/2020', '8/15/2020', 5, 752.36, 10, 5, 767.36, NULL)

--•	Occupancies (Id, EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)

CREATE TABLE Occupancies
(	
	Id INT PRIMARY KEY,
	EmployeeId INT NOT NULL,
	DateOccupied DATETIME NOT NULL,
	AccountNumber INT NOT NULL,
	RoomNumber INT NOT NULL,
	RateApplied INT,
	PhoneCharge DECIMAL(15,2),
	Notes NVARCHAR(MAX)
)

INSERT INTO Occupancies (Id, EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)
VALUES
(21,3, GETDATE(),91, 128, NULL, NULL,NULL),
(22,3, GETDATE(),92, 254, NULL, NULL,NULL),
(23,3, GETDATE(),93, 302, NULL, NULL,NULL)


