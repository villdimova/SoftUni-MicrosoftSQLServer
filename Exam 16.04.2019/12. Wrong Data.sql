/*
Create a user defined stored procedure, named usp_CancelFlights
The procedure must cancel all flights on which the arrival time is before the departure time.
Cancel means you need to leave the departure and arrival time empty.

*/

create procedure usp_CancelFlights
as
begin
	
	declare @wrongdatesFlights table
	( flightID int not null)

	insert into @wrongdatesFlights
	select id from flights where ArrivalTime>DepartureTime

	update flights 
	set DepartureTime =null
	where id in (select flightID from @wrongdatesFlights )
	
	update flights 
	set ArrivalTime =null
	where id in (select flightID from @wrongdatesFlights )
	
end




EXEC usp_CancelFlights
SELECT COUNT(*) 
 FROM Flights 
 WHERE DepartureTime IS NULL