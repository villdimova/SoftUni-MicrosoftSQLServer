CREATE DATABASE SoftUni


--•	Towns (Id, Name)
--Towns: Sofia, Plovdiv, Varna, Burgas
CREATE TABLE Towns 
(	Id INT PRIMARY KEY IDENTITY, 
	[Name] NVARCHAR(50) NOT NULL 
)

INSERT INTO Towns(Name)
VALUES
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas')

--•	Addresses (Id, AddressText, TownId)

CREATE TABLE Addresses 
(	Id INT PRIMARY KEY IDENTITY, 
	AddressText NVARCHAR(100), 
	TownId INT NOT NULL,
	FOREIGN KEY (TownId) REFERENCES Towns(Id)
	
)
INSERT INTO Addresses(AddressText, TownId)
VALUES
('Sofia', 1),
('Plovdiv',2),
('Varna',3),
('Burgas',4)

--•	Departments (Id, Name)
--Departments: Engineering, Sales, Marketing, Software Development, Quality Assurance
CREATE TABLE Departments 
(	Id INT PRIMARY KEY IDENTITY, 
	[Name] NVARCHAR(30) NOT NULL
)
INSERT INTO Departments(Name)
VALUES
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance')


--•	Employees (Id, FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary, AddressId)
CREATE TABLE Employees
(	Id INT PRIMARY KEY IDENTITY, 
	FirstName NVARCHAR(20) NOT NULL,
	MiddleName NVARCHAR(20) NOT NULL,
	LastName NVARCHAR(20) NOT NULL,
	JobTitle NVARCHAR(30) NOT NULL,
	DepartmentId INT NOT NULL,
	FOREIGN KEY (DepartmentId) REFERENCES Departments(Id),
	HireDate DATE,
	Salary DECIMAL(15,2) NOT NULL,
	AddressId INT NOT NULL,
	FOREIGN KEY (AddressId) REFERENCES Addresses(Id)
)
--Name					Job Title		Department				Hire Date		Salary
--Ivan Ivanov Ivanov	.NET Developer	Software Development	01/02/2013		3500.00
--Petar Petrov Petrov	Senior Engineer	Engineering				02/03/2004		4000.00
--Maria Petrova Ivanova	Intern			Quality Assurance		28/08/2016		525.25
--Georgi Teziev Ivanov	CEO				Sales					09/12/2007		3000.00
--Peter Pan Pan			Intern			Marketing				28/08/2016		599.88

INSERT INTO Employees(FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary, AddressId)
VALUES
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '02/01/2013', 3500.00, 1),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '03/02/2004', 4000.00,2),
('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '08/28/2016', 525.25, 3),
('Georgi',  'Teziev',  'Ivanov', 'CEO', 2, '12/09/2007', 3000.00,4),
('Peter', 'Pan', 'Pan', 'Intern', 3, '08/28/2016', 599.88, 1 )

SELECT * FROM Towns
ORDER BY Name;

SELECT * FROM Departments
ORDER BY Name;

SELECT * FROM Employees
ORDER BY Salary Desc;



SELECT [Name] FROM Towns
ORDER BY Name;

SELECT [Name] FROM Departments
ORDER BY Name;

SELECT FirstName, LastName, JobTitle, Salary FROM Employees
ORDER BY Salary Desc;

SELECT * FROM Employees
ORDER BY Salary Desc;

UPDATE Employees 
SET Salary +=  Salary*0.10

SELECT Salary FROM Employees




