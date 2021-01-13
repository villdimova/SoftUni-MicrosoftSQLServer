--•	Id – unique number for every user. There will be no more than 263-1 users. (Auto incremented)
--•	Username – unique identifier of the user will be no more than 30 characters (non Unicode). (Required)
--•	Password – password will be no longer than 26 characters (non Unicode). (Required)
--•	ProfilePicture – image with size up to 900 KB. 
--•	LastLoginTime
--•	IsDeleted – shows if the user deleted his/her profile. Possible states are true or false.



CREATE TABLE Users
(
	Id BIGINT PRIMARY KEY IDENTITY,
	Username VARCHAR(30) NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	ProfilePicture IMAGE,
	LastLoginTime DATETIME,
	IsDeleted BIT

)

INSERT INTO Users
(Username, [Password], ProfilePicture, LastLoginTime, IsDeleted)
VALUES
('ivan245', 'may654', NULL, '1/03/2019','true'),
('maria29', 'june59', NULL, '1/01/2021','false'),
('peter54', 'lemon65', NULL, '11/01/2021','false'),
('emily26', 'vanilla27', NULL, '10/12/2020','false'),
('hero245', 'orange23', NULL, '8/10/2019','true')

ALTER TABLE Users
DROP CONSTRAINT [PK__Users__3214EC0727CE2FE2]

ALTER TABLE Users
ADD CONSTRAINT PK_IdUsername PRIMARY KEY (Id,Username)

ALTER TABLE Users 
ADD CONSTRAINT USERS_TABLE_PASSWORD_CHECK CHECK (DATALENGTH([Password]) >=5)

ALTER TABLE Users
ADD CONSTRAINT DF_LastLoginTime DEFAULT GETDATE() FOR LastLoginTime 

ALTER TABLE Users
DROP CONSTRAINT PK_IdUsername

ALTER TABLE Users
ADD CONSTRAINT PK_Id PRIMARY KEY (Id)

ALTER TABLE Users 
ADD CONSTRAINT CH_UsernameShouldBeAtLeast3Symbols CHECK (LEN(Username) >=3)




