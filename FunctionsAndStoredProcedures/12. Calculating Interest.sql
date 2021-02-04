CREATE FUNCTION ufn_CalculateFutureValue (@sum DECIMAL(15,4),@yearlyInterestRate FLOAT,@NumberOfYears INT)
RETURNS DECIMAL(15,4)
AS
BEGIN
	RETURN @sum*(POWER((1+@yearlyInterestRate),@NumberOfYears))
END

CREATE PROC usp_CalculateFutureValueForAccount(@accountID INT,@interest FLOAT)
AS
SELECT a.Id AS [Account Id], 
		ah.FirstName AS [First Name],
		ah.LastName AS [Last Name],
		a.Balance AS [Current Balance],
		dbo.ufn_CalculateFutureValue(a.Balance,@interest,5) AS [Balance in 5 years]
FROM Accounts a
JOIN AccountHolders ah ON a.AccountHolderId=AH.Id
WHERE a.Id=@accountID

EXEC usp_CalculateFutureValueForAccount 1, 0.1