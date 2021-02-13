create database Bitbucket

use Bitbucket

create table Users
(
	Id int primary key identity,
	Username varchar(30) not null,
	Password varchar(30) not null,
	Email varchar(50) not null

)

create table Repositories
(
	Id int primary key identity,
	Name varchar(50) not null

)

create table RepositoriesContributors
(
	RepositoryId int not null references Repositories(Id),
	ContributorId int not null references Users(Id)
	constraint pk_RepositoriesContributors 
	primary key(RepositoryId,ContributorId)

)

create table Issues
(
	Id int primary key identity,
	Title varchar(255) not null,
	IssueStatus char(6) not null,
	RepositoryId int not null references Repositories(Id),
	AssigneeId int not null references Users(Id)

)
create table Commits
(
	Id int primary key identity,
	Message varchar(255) not null,
	IssueId int references Issues(Id),
	RepositoryId int not null references Repositories(Id),
	ContributorId int not null references Users(Id)

)
create table Files
(
	Id int primary key identity,
	Name varchar(100) not null,
	Size decimal(18,2) not null,
	ParentId int references Files(Id),
	CommitId int not null references Commits(Id)

)