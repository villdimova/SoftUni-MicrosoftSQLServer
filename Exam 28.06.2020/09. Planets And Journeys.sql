

SELECT p.[Name] AS PlanetName,
		COUNT(j.Id)	AS JourneysCount
FROM Planets p
LEFT JOIN Spaceports sp ON sp.PlanetId=p.Id
LEFT JOIN Journeys j ON j.DestinationSpaceportId=sp.Id
GROUP BY p.Id,p.Name
HAVING COUNT(j.Id)>0
ORDER BY JourneysCount DESC,PlanetName
