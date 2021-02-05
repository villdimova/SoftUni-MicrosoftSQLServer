CREATE PROCEDURE usp_AssignProject(@emloyeeId INT, @projectID INT) 
AS
	CREATE TRIGGER tr_DeletedEmployees
ON Employees AFTER DELETE 
AS 
INSERT Deleted_Employees(FirstName, LastName, MiddleName, JobTitle, DepartmentId, Salary)
SELECT d.FirstName,d.LastName,d.MiddleName,d.JobTitle,d.DepartmentID,d.Salary FROM deleted d