/*
Select all countries with their most active distributor 
(the one with the greatest number of ingredients). 
If there are several distributors with most ingredients delivered,
list them all. Order by country name then by distributor name.
Required columns:
•	CountryName
•	DistributorName
	RANK() OVER   
    (PARTITION BY i.LocationID ORDER BY i.Quantity DESC) AS Rank 

*/


SELECT s.CountryName,
		s.DisributorName,
		S.Rank
FROM
(SELECT  
		c.Name as CountryName,
		d.Name as DisributorName,
		RANK() OVER (PARTITION BY c.Id ORDER BY Count(d.Id) desc) AS Rank
FROM Distributors d
 LEFT JOIN  Ingredients i ON i.DistributorId=d.Id
 LEFT JOIN Countries c ON c.Id=d.CountryId
 WHERE i.iD IS NOT NULL
GROUP BY C.Id,c.Name,d.Name
)AS s
WHERE s.Rank=1 
ORDER BY s.CountryName,s.DisributorName

