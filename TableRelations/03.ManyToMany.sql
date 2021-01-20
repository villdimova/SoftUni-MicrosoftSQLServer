
CREATE TABLE Students
(
	StudentID INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(100) NOT NULL
)
INSERT INTO Students([Name])
Values
	('Mila'),
	('Toni'),
	('Ron')
	

CREATE TABLE Exams
(
	ExamID INT PRIMARY KEY,
	[Name] NVARCHAR(100) NOT NULL
)

INSERT INTO Exams
VALUES
	(101,'SpringMVC'),
	(102,'Neo4j'),
	(103,'Oracle 11g')

CREATE TABLE StudentsExams
(
	StudentID INT ,
	ExamID INT 
	PRIMARY KEY(StudentID,ExamID)
	FOREIGN KEY(StudentID) REFERENCES Exams(ExamID),
	FOREIGN KEY(ExamID) REFERENCES Students(StudentID)
)	
