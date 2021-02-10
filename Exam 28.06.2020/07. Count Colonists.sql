SELECT COUNT(*)
FROM Colonists c
JOIN TravelCards tc ON  c.Id=tc.ColonistId
JOIN Journeys j ON j.Id=tc.JourneyId
WHERE j.Purpose='Technical'
GROUP BY j.Purpose