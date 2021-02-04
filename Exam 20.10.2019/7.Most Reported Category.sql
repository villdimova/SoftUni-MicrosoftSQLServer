SELECT TOP(5)
		c.[Name] AS CategoryName,
		COUNT(*)AS ReportsNumber		
FROM Categories c
LEFT JOIN Reports r ON c.Id=r.CategoryId
GROUP BY c.[Name]
ORDER BY ReportsNumber DESC,CategoryName