SELECT s.Name,
		s.Manufacturer
FROM Spaceships s
LEFT JOIN Journeys j ON s.Id=j.SpaceshipId
LEFT JOIN TravelCards tc ON  j.Id=tc.JourneyId
LEFT JOIN Colonists c ON c.Id=tc.ColonistId
WHERE DATEDIFF(YEAR,c.BirthDate,'01/01/2019')<30 AND tc.JobDuringJourney='Pilot'
ORDER BY s.Name

