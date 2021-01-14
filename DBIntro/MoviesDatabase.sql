CREATE DATABASE	Movies 	

--•	Directors (Id, DirectorName, Notes)
CREATE TABLE Directors
(	Id INT PRIMARY KEY,
	DirectorName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX)
)

INSERT INTO Directors (Id, DirectorName, Notes)
VALUES
(1, 'Ivan Ivanov', 'CTO'),
(2, 'Peter Petrov', NULL),
(3, 'Maria Andreeva', 'CFO'),
(4, 'Ivaylo Mateev', 'CTO'),
(5, 'Dragan Petrov', NULL)

--•	Genres (Id, GenreName, Notes)
CREATE TABLE Genres
(	Id INT PRIMARY KEY,
	GenreName NVARCHAR(20) NOT NULL,
	Notes NVARCHAR(MAX)
)

INSERT INTO Genres (Id, GenreName, Notes)
VALUES
(1, 'Romance', 'Entertaiming'),
(2, 'Comedy', 'Funny'),
(3, 'Thriller', 'Scary'),
(4, 'Fantasy', NULL),
(5, 'Action', NULL)

--•	Categories (Id, CategoryName, Notes)
CREATE TABLE Categories
(	Id INT PRIMARY KEY,
	CategoryName NVARCHAR(20) NOT NULL,
	Notes NVARCHAR(MAX)
)

INSERT INTO Categories (Id, CategoryName, Notes)
VALUES
(1, 'History', 'Historycal'),
(2, 'Parody', 'Funny'),
(3, 'Psycho', 'Scary'),
(4, 'Space Travel', NULL),
(5, 'Paranormal', NULL)

--•	Movies (Id, Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
CREATE TABLE Movies
(	Id INT PRIMARY KEY,
	Title NVARCHAR(50) NOT NULL,
	DirectorId INT NOT NULL,
	CopyrightYear VARCHAR(4) NOT NULL,
	[Length] INT,
	GenreId INT NOT NULL,
	CategoryId INT NOT NULL,
	Rating INT NOT NULL,
	Notes NVARCHAR(MAX)
)
INSERT INTO Movies (Id, Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
VALUES
(1, 'Titanic', 2, 2000, NULL, 1, 1,8,NULL),
(2, 'Fast and furious', 1, 2002, NULL, 5, 3, 6, NULL),
(3, 'Green mile', 3, 2005, NULL, 3, 5, 8, NULL),
(4, 'The Ring', 4, 2003, NULL, 3, 3,5,NULL),
(5, 'Die Hard', 5, 1997, NULL, 1, 1,4,NULL)

