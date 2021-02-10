
CREATE FUNCTION dbo.udf_GetColonistsCount(@PlanetName VARCHAR (30)) 
RETURNS INT
AS
BEGIN
	DECLARE @ColonistsCount INT =(SELECT COUNT(*)
							FROM Journeys j
							JOIN Spaceports sp ON sp.Id=j.DestinationSpaceportId
							JOIN Planets p ON p.Id=sp.PlanetId
							JOIN  TravelCards tc ON tc.JourneyId=j.Id
							JOIN Colonists c ON c.Id=tc.ColonistId
							GROUP BY p.Name
							HAVING p.Name=@PlanetName)

			IF(@ColonistsCount IS NULL)
				BEGIN 
					SET @ColonistsCount=0;
				END 
	RETURN @ColonistsCount
END




