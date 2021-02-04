SELECT [Description],
		FORMAT(OpenDate,'dd-MM-yyyy')
FROM Reports r
WHERE r.EmployeeId IS NULL
ORDER BY r.Opendate,[Description]

