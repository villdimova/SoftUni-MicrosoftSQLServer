
CREATE TABLE NotificationEmails 
(
Id INT  PRIMARY KEY IDENTITY,
Recipient INT NOT NULL REFERENCES Accounts(Id), 
[Subject] NVARCHAR(100) NOT NULL, 
Body NVARCHAR(200) NOT NULL
)

CREATE TRIGGER tr_LogRecordOnAccountChange
ON Logs FOR INSERT
AS
	INSERT NotificationEmails(Recipient,[Subject],Body)
	SELECT l.AccountId,'Balance change for account: ' + + CAST(l.AccountId AS VARCHAR(15)),'On '+CAST(GETDATE() AS VARCHAR(30))+ 
	' your balance was changed from '+CAST(l.OldSum AS VARCHAR(30))+' to ' +CAST(l.NewSum AS VARCHAR(30))+'.'
	FROM Logs l
	


SELECT * FROM NotificationEmails
