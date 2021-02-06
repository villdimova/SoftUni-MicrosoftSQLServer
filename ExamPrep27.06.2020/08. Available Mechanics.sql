SELECT m.FirstName + ' ' + m.LastName AS Available
FROM Mechanics m
LEFT JOIN Jobs j ON j.MechanicId=m.MechanicId
WHERE (SELECT COUNT(JobId)
FROM Jobs
WHERE Status <> 'Finished' AND MechanicId=m.MechanicId
GROUP BY MechanicId,Status)IS NULL
GROUP BY m.MechanicId,M.FirstName,m.LastName
ORDER BY m.MechanicId

