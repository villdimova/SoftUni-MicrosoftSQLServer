SELECT 
	   u.Username AS Username,
		 G.Name,
	   COUNT(I.ItemTypeId) AS [Items Count],
	  SUM( i.Price )AS [Items Price] 
FROM Users u
LEFT JOIN UsersGames ug ON u.Id=ug.UserId
LEFT JOIN Games g ON ug.GameId=g.Id
LEFT JOIN UserGameItems ugi ON ug.Id=ugi.UserGameId
LEFT JOIN Items i ON i.Id=ugi.ItemId 
GROUP BY U.Username,G.NAME
HAVING COUNT(I.ItemTypeId)>=10
ORDER BY [Items Count] DESC,[Items Price] desc,u.Username

