SELECT	p.PartId AS PartId,
		p.Description AS [Description],
		pn.Quantity as [Required],
		p.StockQty as [In stock],
		IIF(o.Delivered=0,op.Quantity,0) as [Ordered]
FROM Parts p
LEFT JOIN PartsNeeded pn ON pn.PartId=p.PartId
LEFT JOIN OrderParts op ON op.PartId=p.PartId
LEFT JOIN Jobs j ON j.JobId=pn.JobId
LEFT JOIN Orders o ON o.JobId=j.JobId
WHERE j.Status !='Finished' AND pn.Quantity>IIF(o.Delivered=0,op.Quantity,0)+p.StockQty

