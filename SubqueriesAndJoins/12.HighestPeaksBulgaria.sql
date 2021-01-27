SELECT mc.CountryCode,
	   m.MountainRange,
	   p.PeakName,
	   p.Elevation
FROM Peaks p
LEFT JOIN Mountains m ON p.MountainId=m.Id
LEFT JOIN MountainsCountries mc ON m.Id=MC.MountainId
WHERE P.Elevation>2835 AND mc.CountryCode='BG'
ORDER BY Elevation DESC






