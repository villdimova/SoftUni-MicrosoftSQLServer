CREATE PROC usp_WithdrawMoney  (@AccountId INT, @MoneyAmount DECIMAL(15,4)) 
AS
BEGIN TRANSACTION

DECLARE @CurrentBalance DECIMAL(15,4)=(SELECT a.Balance FROM Accounts a WHERE a.Id=@AccountId)
	UPDATE Accounts
	SET Balance=Balance-@MoneyAmount;
	IF(@CurrentBalance IS NULL OR @MoneyAmount<0)
	BEGIN
		ROLLBACK
		RAISERROR('Not valid MoneyAmount',16,1)
		RETURN
		END
COMMIT


EXEC usp_WithdrawMoney 5,-10

SELECT * FROM Accounts
WHERE Id=5