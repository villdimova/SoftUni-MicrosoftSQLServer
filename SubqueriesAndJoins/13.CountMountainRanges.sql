SELECT c.CountryCode ,COUNT(*)
FROM COUNTRIES AS c
JOIN MountainsCountries mc ON c.CountryCode=mc.CountryCode
WHERE c.CountryCode IN('US','RU','BG')
GROUP BY c.CountryCode







