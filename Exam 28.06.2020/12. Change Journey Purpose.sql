
CREATE PROCEDURE usp_ChangeJourneyPurpose(@JourneyId INT, @NewPurpose VARCHAR(11))
AS
BEGIN 
	DECLARE @DoesJIDExists INT= (SELECT Id FROM Journeys WHERE Id=@JourneyId)
		IF(@DoesJIDExists IS NULL)
			THROW 50001,'The journey does not exist!',1
	
	DECLARE @JourneyCurrentPurpose VARCHAR(11)=(SELECT Purpose FROM Journeys WHERE Id=@JourneyId)
		IF(@JourneyCurrentPurpose=@NewPurpose)
			THROW 50002,'You cannot change the purpose!',1

	UPDATE Journeys
	SET Purpose=@NewPurpose
	WHERE Id=@JourneyId
END

EXEC usp_ChangeJourneyPurpose 4, 'Technical'
SELECT *
FROM Journeys
where Id=4
EXEC usp_ChangeJourneyPurpose 2, 'Educational'
EXEC usp_ChangeJourneyPurpose 196, 'Technical'


