CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4))
RETURNS NVARCHAR(10)
AS
BEGIN 
DECLARE @result NVARCHAR(10)	
	IF @salary <30000 
		SET  @result='Low'
	ELSE IF @salary BETWEEN 30000 AND 50000 
		SET @result='Average'
	ELSE 
		SET @result='High'
	RETURN @result
END

CREATE PROC usp_EmployeesBySalaryLevel(@result NVARCHAR(10))
AS
SELECT FirstName ,
		LastName
FROM Employees
WHERE dbo.ufn_GetSalaryLevel(Salary)=@result


EXEC usp_EmployeesBySalaryLevel 'High'		