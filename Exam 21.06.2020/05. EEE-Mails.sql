
SELECT a.FirstName,
		a.LastName,
		FORMAT(a.BirthDate,'MM-dd-yyyy') AS BirthDate,
		c.Name AS [Hometown],
		a.Email
FROM Accounts a
JOIN Cities c ON a.CityId=c.Id
WHERE Email LIKE 'E%'
ORDER BY c.Name

