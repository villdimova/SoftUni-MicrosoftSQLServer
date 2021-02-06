SELECT j.JobId AS JobId,
	CASE
	WHEN
		SUM(p.Price*op.Quantity)IS NULL THEN 0.00 ELSE SUM(p.Price*op.Quantity)END AS Total	
FROM Jobs j
LEFT JOIN Orders o ON j.JobId=o.JobId
LEFT JOIN OrderParts op ON op.OrderId=o.OrderId
LEFT JOIN Parts p ON op.PartId=p.PartId
WHERE j.Status='Finished'
GROUP BY j.JobId
ORDER BY Total DESC,JobId

