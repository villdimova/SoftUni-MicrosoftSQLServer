/*
Create a user defined function, named udf_CalculateTickets(@origin, @destination, @peopleCount) 
that receives an origin (town name), destination (town name) and people count.
The function must return the total price in format "Total price {price}"
•	If people count is less or equal to zero return – "Invalid people count!"
•	If flight is invalid return – "Invalid flight!"
*/


create function udf_CalculateTickets(@origin nvarchar(50), @destination nvarchar(50), @peopleCount int) 
returns varchar(max)
as
begin
	
	if(@peopleCount<=0)
	return 'Invalid people count!'

	declare @flightId int= (select Id from Flights where Origin=@origin and Destination=@destination )

	if(@flightId is null)
	return 'Invalid flight!'

	declare @ticketPrice decimal(18,2)= (select Price from Tickets where FlightId=@flightId)
	return concat('Total price ',convert (varchar,(@ticketPrice*@peopleCount)))

end

SELECT dbo.udf_CalculateTickets('Kolyshley','Rancabolang', 33)

SELECT dbo.udf_CalculateTickets('Kolyshley','Rancabolang', -1)

SELECT dbo.udf_CalculateTickets('Invalid','Rancabolang', 33)