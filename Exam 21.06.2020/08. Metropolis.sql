
SELECT TOP(10)
		c.Id AS Id,
		c.[Name] AS [Name],
		c.CountryCode AS Country,
		COUNT(*) AS Accounts
FROM Cities c
JOIN Accounts a ON a.CityId=c.Id
GROUP BY c.Id,c.Name,c.CountryCode
ORDER BY Accounts DESC

