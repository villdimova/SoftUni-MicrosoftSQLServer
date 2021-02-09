SELECT 
		
		CASE WHEN (e.FirstName + ' ' + e.LastName)IS NULL THEN 'None' ELSE (e.FirstName + ' ' + e.LastName)  END AS Employee,
		CASE WHEN d.[Name] IS NULL THEN 'None' ELSE d.[Name] END AS Department,
	    CASE WHEN c.[Name]  IS NULL THEN 'None' ELSE c.[Name] END AS Category,
		r.[Description],
		FORMAT(r.OpenDate,'dd.MM.yyyy') AS OpenDate,
		s.[Label]  AS [Status],
		CASE WHEN u.[Name] IS NULL THEN 'None' ELSE u.[Name] END  AS [User]
FROM Reports r
LEFT JOIN Employees e ON e.Id=r.EmployeeId
LEFT JOIN Departments d ON e.DepartmentId=d.Id
LEFT JOIN Categories c ON c.Id=r.CategoryId
LEFT JOIN [Status] s ON s.Id=r.StatusId
LEFT JOIN Users u ON u.Id=r.UserId
ORDER BY e.FirstName DESC,
		 e.LastName DESC,
		 d.[Name],
		 c.[Name],
		 r.[Description],
		 r.OpenDate,
		 s.[Label],
		 u.[Name]






