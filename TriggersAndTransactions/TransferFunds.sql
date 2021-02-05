CREATE PROC udp_TransferFunds(@FromAccountId INT, @ToAccountId INT, @Amount MONEY)
AS
BEGIN TRANSACTION
IF((SELECT Balance FROM Accounts WHERE Id=@FromAccountId)<1000)
	BEGIN 
		ROLLBACK;
		THROW 50001,'Not enough money',1;
	END
IF(SELECT COUNT(*) FROM Accounts WHERE Id=@FromAccountId)<1
	BEGIN
		ROLLBACK;
		THROW 50002,'No account with this Id',1
	END
IF(SELECT COUNT(*) FROM AccountS WHERE Id=@ToAccountId)<1
	BEGIN
		ROLLBACK;
		THROW 50003,'No account with this Id',1;
	END
	UPDATE Accounts SET Balance=Balance-1000 WHERE Id=@FromAccountId;
	UPDATE Accounts SET Balance=Balance+1000 WHERE Id=@ToAccountId;
	COMMIT
	GO