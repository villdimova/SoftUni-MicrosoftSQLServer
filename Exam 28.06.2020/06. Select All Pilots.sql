SELECT c.Id,
		c.FirstName+' '+c.LastName as full_name
FROM Colonists c
JOIN TravelCards tc ON  c.Id=tc.ColonistId
WHERE tc.JobDuringJourney='Pilot'
ORDER BY c.Id