create table Students
(
	Id int primary key identity,
	FirstName nvarchar(30) not null,
	MiddleName nvarchar(25),
	LastName nvarchar(30) not null,
	Age int check(age between 5 and 100),
	Address nvarchar(50),
	Phone nchar(10)

)

create table Subjects
(
	Id int primary key identity,
	Name nvarchar(20) not null,
	Lessons int check (Lessons>0) not null

)
create table StudentsSubjects
(
	Id int primary key identity,
	StudentId int not null references Students(Id),
	SubjectId int not null references Subjects(Id),
	Grade decimal(3,2)check(Grade between 2 and 6) not null

)
create table Exams
(
	Id int primary key identity,
	Date datetime,
	SubjectId int not null references Subjects(Id)

)
create table StudentsExams
(
	StudentId int not null references Students(Id),
	ExamId int not null references Exams(Id),
	Grade decimal(3,2)check(Grade between 2 and 6) not null
	constraint pk_StudentsExams primary key(StudentId,ExamId)
)
create table Teachers
(
	Id int primary key identity,
	FirstName nvarchar(20) not null,
	LastName nvarchar(20) not null,
	Address nvarchar(20) not null,
	Phone nchar(10),
	SubjectId int not null references Subjects(Id)


)
create table StudentsTeachers
(
	StudentId int not null references Students(Id),
	TeacherId int not null references Teachers(Id)
	constraint pk_StudentsTeachers
	primary key(StudentId,TeacherId)

)