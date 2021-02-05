CREATE PROCEDURE usp_AssignProject(@emloyeeId INT, @projectID INT) 
AS
	BEGIN TRANSACTION
		DECLARE @CountProjects INT=
		(SELECT COUNT(*)
		FROM EmployeesProjects
		WHERE EmployeeID=@emloyeeId)
	INSERT INTO EmployeesProjects(EmployeeID,ProjectID)
	VALUES
	(@emloyeeId, @projectID)

IF(@CountProjects>=3)
	BEGIN
	ROLLBACK
	RAISERROR ('The employee has too many projects!',16,1)
	END
COMMIT