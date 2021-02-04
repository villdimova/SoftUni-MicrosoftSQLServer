CREATE FUNCTION ufn_CalculateFutureValue (@sum DECIMAL(15,4),@yearlyInterestRate FLOAT,@NumberOfYears INT)
RETURNS DECIMAL(15,4)
AS
BEGIN
	RETURN @sum*(POWER((1+@yearlyInterestRate),@NumberOfYears))
END

SELECT dbo.ufn_CalculateFutureValue(1000,0.10,5)