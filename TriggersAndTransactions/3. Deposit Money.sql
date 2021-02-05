CREATE PROC usp_DepositMoney (@AccountId INT, @MoneyAmount DECIMAL(15,4)) 
AS
BEGIN TRANSACTION

	UPDATE Accounts
	SET Balance=Balance+@MoneyAmount;
	IF(@MoneyAmount IS NULL OR @MoneyAmount<0)
	BEGIN
		ROLLBACK
		RAISERROR('Not valid MoneyAmount',16,1)
		RETURN
		END


COMMIT