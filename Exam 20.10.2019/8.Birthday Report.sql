SELECT u.Username,
		u.Birthdate,
		r.CloseDate,
		c.[Name] AS CategoryName
FROM Users u
JOIN  Reports r ON r.UserId=u.Id
JOIN Categories c ON c.Id=r.CategoryId
WHERE (DATEPART(MONTH,r.OpenDate)= DATEPART(MONTH,u.Birthdate))AND (DATEPART(DAY,r.OpenDate)= DATEPART(DAY,u.Birthdate))
ORDER BY u.Username,CategoryName
 
 