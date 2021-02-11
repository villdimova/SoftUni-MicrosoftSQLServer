/*

*/


SELECT s.CountryName,
		s.DisributorName
FROM
(SELECT  
		c.Name as CountryName,
		d.Name as DisributorName,
		RANK() OVER (PARTITION BY c.Id ORDER BY Count(i.Id) desc) AS Rank
FROM Distributors d
 LEFT JOIN  Ingredients i ON i.DistributorId=d.Id
 LEFT JOIN Countries c ON c.Id=d.CountryId
 
GROUP BY C.Id,c.Name,d.Name
)AS s
WHERE s.Rank=1 
ORDER BY s.CountryName,s.DisributorName

