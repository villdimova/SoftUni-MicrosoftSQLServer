
SELECT COUNT(RCount.CountryCode) 
FROM(SELECT c.CountryCode FROM Countries c
LEFT JOIN MountainsCountries mc ON c.CountryCode=mc.CountryCode
LEFT JOIN Mountains m ON m.Id=mc.MountainId
WHERE m.MountainRange IS NULL) AS RCount







