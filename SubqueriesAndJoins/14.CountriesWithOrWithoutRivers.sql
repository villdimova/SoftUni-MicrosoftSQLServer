SELECT TOP(5)
		c.CountryName,
		r.RiverName
FROM COUNTRIES AS c
LEFT JOIN CountriesRivers rc ON c.CountryCode=rc.CountryCode
LEFT JOIN Rivers r ON r.ID=rc.RiverId
WHERE c.ContinentCode='AF'
ORDER BY c.CountryName




--•	CountryName
--•	RiverName
--Find the first 5 countries with or without rivers in Africa. Sort them by CountryName in ascending order.





