SELECT DISTINCT hs.DepartmentID,
		 hs.Salary 
FROM
(SELECT DepartmentID,
		 Salary,
		DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS Ranked
FROM Employees)AS hs
WHERE Ranked=3
