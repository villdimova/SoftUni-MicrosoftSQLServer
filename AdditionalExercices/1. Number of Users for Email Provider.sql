SELECT s.[Email Provider],
	   COUNT(*) AS [Number Of Users]
FROM 
(SELECT SUBSTRING(Email,CHARINDEX('@',Email)+1,LEN(Email)-CHARINDEX('@',Email))AS [Email Provider]
FROM Users) AS s
GROUP BY s.[Email Provider]
ORDER BY [Number Of Users] DESC,[Email Provider]

