SELECT g.Name AS [Game],
	   gt.Name AS [Game Type],
	   u.Username,
	   ug.Level,
	   ug.Cash,
	   c.Name AS [Character]
FROM Users u
LEFT JOIN UsersGames ug ON u.Id=ug.UserId
LEFT JOIN Games g ON ug.GameId=g.Id
LEFT JOIN GameTypes gt ON gt.Id=g.GameTypeId
LEFT JOIN Characters c ON c.Id=ug.CharacterId
ORDER BY ug.Level DESC,u.Username,g.Name

