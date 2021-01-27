

		
SELECT Curr.ContinentCode,
	   Curr.CurrencyCode,
	   Curr.CurrencyUsage
FROM (SELECT ContinentCode,CurrencyCode,COUNT(CurrencyCode) AS CurrencyUsage,
DENSE_RANK() OVER (PARTITION BY ContinentCode ORDER BY COUNT(CurrencyCode)DESC) AS Ranked
FROM Countries
GROUP BY ContinentCode,CurrencyCode) AS Curr
WHERE CuRR.Ranked=1 AND Curr.CurrencyUsage>1
Order BY ContinentCode



--•	ContinentCode
--•	CurrencyCode
--•	CurrencyUsage
--Find all continents and their most used currency. 
--Filter any currency that is used in only one country. Sort your results by ContinentCode.





