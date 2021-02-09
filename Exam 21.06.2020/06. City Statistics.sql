
SELECT c.Name AS City,
		COUNT(h.Id)AS Hotels
FROM Cities c
LEFT JOIN Hotels h ON c.Id=h.CityId
GROUP BY c.Name
HAVING COUNT(h.Id)>0
ORDER BY Hotels DESC,City