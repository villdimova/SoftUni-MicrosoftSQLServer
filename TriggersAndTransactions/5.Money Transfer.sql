CREATE PROC usp_TransferMoney  (@SenderId INT,@ReceiverId INT, @Amount DECIMAL(15,4)) 
AS
BEGIN TRANSACTION

DECLARE @SenderAccountBalance DECIMAL(15,4)=(SELECT a.Balance FROM Accounts a WHERE a.Id=@SenderId)

	UPDATE Accounts
	SET Balance=Balance-@Amount
	WHERE Id=@SenderId;

	UPDATE Accounts
	SET Balance=Balance+@Amount
	WHERE Id=@ReceiverId;

	IF(@Amount IS NULL OR @Amount<0)
	BEGIN
	ROLLBACK
	RAISERROR('Amount is not valid',16,1)
	END

	IF(@SenderAccountBalance-@Amount<0 )
	BEGIN
		ROLLBACK
		RAISERROR('Not enough money in the sender account',16,1)
		RETURN
		END
COMMIT



SELECT * FROM Accounts
WHERE Id IN (1,5)

EXEC usp_TransferMoney 1,5,-10

