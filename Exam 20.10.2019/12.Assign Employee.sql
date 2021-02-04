CREATE PROC usp_AssignEmployeeToReport(@EmployeeId INT, @ReportId INT) 
AS 
BEGIN
DECLARE @EmployeeDepartment INT = (SELECT e.DepartmentId FROM Employees AS e WHERE @EmployeeId = e.Id)


DECLARE @CategoryDepartment INT = (SELECT c.DepartmentId FROM Categories AS c
									JOIN Reports AS r ON r.CategoryId = c.Id
									WHERE @ReportId = r.Id)

IF @EmployeeDepartment != @CategoryDepartment
	THROW 50001, 'Employee doesn''t belong to the appropriate department!', 1

		UPDATE Reports
		SET EmployeeId = @EmployeeId
		WHERE Id=@ReportId

END

EXEC usp_AssignEmployeeToReport 30, 1

EXEC usp_AssignEmployeeToReport 17, 2