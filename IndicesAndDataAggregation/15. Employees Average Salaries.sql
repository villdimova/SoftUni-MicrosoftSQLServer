SELECT * INTO HighestSalaries FROM Employees
WHERE [Salary] >30000

DELETE FROM HighestSalaries
WHERE ManagerID=42

UPDATE HighestSalaries
SET Salary+=5000
WHERE DepartmentID=1

SELECT DepartmentID,
		AVG(Salary)AS AverageSalary
FROM HighestSalaries
GROUP BY DepartmentID