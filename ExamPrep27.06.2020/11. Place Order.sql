CREATE PROC usp_PlaceOrder(@jobId INT, @partSN VARCHAR(50),@partsQuantity INT)
AS
BEGIN 

	DECLARE @jobStatus VARCHAR(11)=(SELECT Status FROM Jobs WHERE JobId=@jobId)
	DECLARE @partId INT=(SELECT PartId FROM Parts WHERE SerialNumber=@partSN)

	IF(@partsQuantity<=0)
		THROW 50012,'Part quantity must be more than zero!',1
	
		IF NOT EXISTS(SELECT 1 FROM Jobs
		WHERE JobId=@jobId)
		THROW 50013,'Job not found!',1
		

		IF(@jobStatus='Finished')
		THROW 50011,'This job is not active!',1
		
		IF NOT EXISTS(SELECT 1 FROM Parts
		WHERE SerialNumber=@partSN)
		THROW 50014,'Part not found!',1
		
DECLARE @orderId INT = (SELECT o.OrderId 
						FROM Orders o
						WHERE o.JobId=@jobId AND IssueDate IS NULL)

IF(@orderId IS NULL)
	BEGIN
		INSERT INTO Orders (JobId,IssueDate)VALUES (@jobId,NULL)
	END
SET @orderId= (SELECT OrderId FROM Orders WHERE JobId=@jobId AND IssueDate IS NULL)
DECLARE @orderPartsExists INT = (SELECT OrderId FROM OrderParts WHERE OrderId=@orderId AND PartId=@partId)
IF(@orderPartsExists IS NULL)
	BEGIN
		INSERT INTO OrderParts(OrderId,PartId,Quantity)
		VALUES
		(@orderId,@partId,@partsQuantity)
	END 
	
ELSE 
	
		BEGIN
			UPDATE OrderParts
			SET Quantity+=@partsQuantity
			WHERE OrderId=@orderId AND PartId=@partId	
		END

END
