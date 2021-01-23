CREATE TABLE People
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(100) NOT NULL,
	Birthdate DATETIME
)

--Id	Name	Birthdate
--1	Victor	2000-12-07 00:00:00.000
--2	Steven	1992-09-10 00:00:00.000
--3	Stephen	1910-09-19 00:00:00.000
--4	John	2010-01-06 00:00:00.000
--…	…	…

INSERT INTO People([Name],Birthdate)
VALUES
('Victor','2000-12-07 00:00:00.000'),
('Steven','1992-09-10 00:00:00.000'),
('Stephen','1910-09-19 00:00:00.000'),
('John','2010-01-06 00:00:00.000')


SELECT [Name],
		Birthdate,
		DATEDIFF(YEAR,Birthdate,GETDATE())AS [Age in Years],
		DATEDIFF(MONTH,Birthdate,GETDATE())[Age in Months],
		DATEDIFF(DAY,Birthdate,GETDATE())[Age in Days],
		DATEDIFF(MINUTE,Birthdate,GETDATE())[Age in Minutes]

FROM People