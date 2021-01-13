--•	Id – unique number for every person there will be no more than 231-1 people. (Auto incremented)
--•	Name – full name of the person will be no more than 200 Unicode characters. (Not null)
--•	Picture – image with size up to 2 MB. (Allow nulls)
--•	Height –  In meters. Real number precise up to 2 digits after floating point. (Allow nulls)
--•	Weight –  In kilograms. Real number precise up to 2 digits after floating point. (Allow nulls)
--•	Gender – Possible states are m or f. (Not null)
--•	Birthdate – (Not null)
--•	Biography – detailed biography of the person it can contain max allowed Unicode characters. (Allow nulls)

CREATE TABLE People
(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(200) NOT NULL,
	Picture IMAGE,
	Height DECIMAL(5,2),
	Weight DECIMAL(5,2),
	Gender VARCHAR(1) NOT NULL,
	Birthdate DATE NOT NULL,
	Biography NVARCHAR(MAX)

)

INSERT INTO People([Name], Picture, Height, [Weight], Gender, Birthdate, Biography) 
VALUES
('Daniel Dimov', NULL, 170, 66, 'm', '1983/06/17', 'DOCTOR'),
('Maria Daneva', NULL, 168, 53, 'f', '1983/06/27', 'DOCTOR'),
('Ivailo Petrov',NULL, 185, 85, 'm', '1993/06/17', 'CEO'),
('Petar Petrov', NULL, 173, 67, 'm', '1980/02/14', 'CTO'),
('Marian Dimov', NULL, 190, 95, 'm', '1997/09/11', 'BANKER')