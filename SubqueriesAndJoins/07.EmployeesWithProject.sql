SELECT TOP(5)
	   e.EmployeeID,
	   e.FirstName,
	   p.[Name] AS [ProjectName]
FROM Employees e
LEFT JOIN EmployeesProjects ep ON e.EmployeeID=ep.EmployeeID
LEFT JOIN Projects p ON ep.ProjectID=p.ProjectID
WHERE p.StartDate > '2002.08.13' AND p.EndDate IS NULL
ORDER BY EmployeeID

