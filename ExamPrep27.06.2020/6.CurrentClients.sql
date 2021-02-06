SELECT FirstName + ' ' + LastName AS Client,
		DATEDIFF(DAY,j.IssueDate,'2017-04-24')AS [Days going],
		j.Status	
FROM Clients c
JOIN Jobs j ON j.ClientId=c.ClientId
WHERE Status!='Finished'
ORDER BY [Days going] DESC,c.ClientId