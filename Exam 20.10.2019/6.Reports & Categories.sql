SELECT [Description],
		c.[Name] AS CategoryName
FROM Reports r
JOIN Categories c ON r.CategoryId=c.Id
ORDER BY r.[Description],c.[Name]
