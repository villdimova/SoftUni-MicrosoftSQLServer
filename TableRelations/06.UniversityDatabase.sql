CREATE TABLE Majors
(
	MajorID INT PRIMARY KEY,
	[Name] NVARCHAR(50) NOT NULL
)
CREATE TABLE Students
(
	StudentID INT PRIMARY KEY,
	StudentNumber CHAR(10) NOT NULL,
	StudentName DECIMAL(10,2) NOT NULL,
	MajorID INT FOREIGN KEY REFERENCES Majors(MajorID)
)
CREATE TABLE Payments
(
	PaymentID INT PRIMARY KEY,
	PaymentDate DATE,
	PaymentAmount DECIMAL(10,2) NOT NULL,
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID)
)

CREATE TABLE Subjects
(
	SubjectID INT PRIMARY KEY,
	SubjectName NVARCHAR(50) NOT NULL
)



CREATE TABLE Agenda
(
	StudentID INT,
	SubjectID INT
	PRIMARY KEY(StudentID,SubjectID)
	FOREIGN KEY(StudentID) REFERENCES Subjects(SubjectID),
	FOREIGN KEY(SubjectID) REFERENCES Students(StudentID)
)