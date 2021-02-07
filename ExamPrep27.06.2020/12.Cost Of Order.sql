CREATE FUNCTION udf_GetCost(@jobId INT)
RETURNS DECIMAL(6,2)
AS 
BEGIN

DECLARE @result DECIMAL(6,2)	
SET @result=(SELECT SUM(p.Price)
					FROM Jobs j
					JOIN Orders o ON o.JobId=j.JobId
					JOIN OrderParts op ON op.OrderId=o.OrderId
					JOIN Parts p ON p.PartId=op.PartId
					WHERE j.JobId=@jobId
					GROUP BY j.JobId)
IF(@result  IS NULL)
	BEGIN 
		SET @result=0
	END

RETURN @result;	
END

