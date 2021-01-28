SELECT TOP(5)
		s.CountryName,
		s.PeakName,
		s.HighestPeakElevation,
		s.MountainRange
FROM (SELECT c.CountryName,
		ISNULL(p.PeakName,'(no highest peak)')AS PeakName,
		ISNULL(m.MountainRange,'(no mountain)') AS MountainRange,
		ISNULL(MAX(p.Elevation),0) AS HighestPeakElevation,
		DENSE_RANK() OVER(PARTITION BY c.CountryName ORDER BY MAX(p.Elevation) DESC) AS Ranked
FROM Countries c 
LEFT JOIN MountainsCountries mc ON c.CountryCode=mc.CountryCode
LEFT JOIN Mountains m ON m.Id=mc.MountainId
LEFT JOIN Peaks p ON p.MountainId=m.Id
LEFT JOIN CountriesRivers cr ON c.CountryCode=cr.CountryCode
LEFT JOIN Rivers r ON r.Id=cr.RiverId
GROUP BY c.CountryName,p.PeakName,m.MountainRange) AS s
WHERE Ranked=1
ORDER BY CountryName,PeakName





