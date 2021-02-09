
CREATE OR ALTER FUNCTION udf_GetAvailableRoom(@HotelId INT, @Date DATE, @People INT)
RETURNS VARCHAR(200)
AS
BEGIN

	DECLARE @Result VARCHAR(200);
	DECLARE @Rooms TABLE( RoomId INT NOT NULL )
	
									INSERT INTO @Rooms
										SELECT r.Id
										FROM Rooms r 
										LEFT JOIN Hotels h ON h.Id=r.HotelId
										WHERE (h.Id=@HotelId)AND r.Beds>=@People 
										ORDER BY R.Price DESC
	
	DECLARE @AvailableRoomiId INT = (SELECT TOP(1) r.RoomId
							FROM @Rooms r
							JOIN Trips t ON t.Id=r.RoomId
							WHERE @Date NOT BETWEEN t.ArrivalDate AND t.ReturnDate)

	IF(@AvailableRoomiId IS NULL)
		BEGIN
			SET @Result= 'No rooms available'
		END
	ELSE
		BEGIN

			
			DECLARE @RoomPrice DECIMAL(15,2)=(SELECT TOP(1)
										r.Price
										FROM Trips t
										LEFT JOIN Rooms r ON r.Id=t.RoomId
										LEFT JOIN Hotels h ON h.Id=r.HotelId
										WHERE (r.HotelId=@HotelId)AND r.Beds>=@People AND (@Date
										NOT BETWEEN t.ArrivalDate AND t.ReturnDate)
										ORDER BY R.Price DESC);

			 DECLARE @HotelRate  DECIMAL(15,2)  =(SELECT
										h.BaseRate
										FROM Hotels h
										WHERE h.Id=@HotelId)
										
			DECLARE  @Price DECIMAL(15,2) =(@HotelRate+@RoomPrice)*@People;

			
			DECLARE @RoomType NVARCHAR(20)= (SELECT TOP(1)
										r.Type
										FROM Rooms r
										WHERE r.Id=@AvailableRoomiId)
	
			DECLARE @NumBeds INT= (SELECT 
										R.Beds
										FROM Rooms r
										WHERE r.Id=@AvailableRoomiId)

		SET @Result=CONCAT('Room ',@AvailableRoomiId,': ', @RoomType,' (',@NumBeds,' beds',') - $',@Price);
		END
	RETURN @Result;
END






