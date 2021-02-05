CREATE TABLE Logs 
(LogId INT  PRIMARY KEY IDENTITY,
AccountId INT NOT NULL REFERENCES Accounts(Id), 
OldSum MONEY NOT NULL, 
NewSum MONEY NOT NULL
)


CREATE TRIGGER tr_AddLogRecordOnAccountChange
ON Accounts FOR UPDATE
AS
	INSERT Logs(AccountId,OldSum,NewSum)
	SELECT i.Id,d.Balance,i.Balance FROM inserted i
	JOIN deleted d ON i.Id=d.Id
GO