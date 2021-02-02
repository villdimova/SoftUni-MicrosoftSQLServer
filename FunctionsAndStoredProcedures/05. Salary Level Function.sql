CREATE FUNCTION ufn_GetSalaryLevel(@Salary MONEY)
RETURNS VARCHAR(8)
AS
BEGIN
	IF (@Salary<30000)
		RETURN 'Low';
	ELSE IF (@Salary BETWEEN 30000 AND 50000)
		RETURN 'Average'

		RETURN 'High'; 

END

SELECT dbo.ufn_GetSalaryLevel(10000)