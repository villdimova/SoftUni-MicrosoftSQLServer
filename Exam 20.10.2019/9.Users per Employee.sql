SELECT FirstName + ' ' + LastName AS FullName,
		COUNT(DISTINCT r.UserId) AS UsersCount
FROM Employees e
LEFT JOIN Reports r ON r.EmployeeId=e.Id
GROUP BY r.EmployeeId,e.FirstName,e.LastName
ORDER BY UsersCount DESC,FullName
