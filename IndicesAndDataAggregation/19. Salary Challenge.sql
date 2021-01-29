SELECT TOP(10) FirstName,
		LastName,
		DepartmentID
FROM Employees e
WHERE e.Salary >(SELECT AVG(Salary)FROM Employees WHERE DepartmentID=e.DepartmentID GROUP BY DepartmentID)
ORDER BY e.DepartmentID