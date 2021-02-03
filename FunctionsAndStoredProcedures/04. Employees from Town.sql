CREATE PROC usp_GetEmployeesFromTown(@townName NVARCHAR(50))
AS
SELECT e.FirstName,
		e.LastName
FROM Employees e
JOIN Addresses a ON a.AddressID=e.AddressID
JOIN Towns t ON t.TownID=a.TownID
WHERE t.Name=@TownName

EXEC usp_GetEmployeesFromTown 'Sofia'

