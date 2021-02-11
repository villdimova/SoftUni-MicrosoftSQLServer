/*
Select all passengers who have trips. Select their full name (first name – last name),
plane name, trip (in format {origin} - {destination}) and luggage type. 
Order the results by full name (ascending), name (ascending), 
origin (ascending), destination (ascending) and luggage type (ascending).
*/

select  
		concat(FirstName,' ',LastName)as [Full Name],
		pl.Name as [Plane Name],
		concat(f.Origin,' - ',f.Destination)as Trip,
		lt.Type as [Luggage Type]
from Passengers p
join Tickets t on p.Id=t.PassengerId
join Flights f on f.Id=t.FlightId
join Planes pl on f.PlaneId=pl.Id
join Luggages l on l.Id=t.LuggageId
 join LuggageTypes lt on lt.Id=l.LuggageTypeId
where t.Id is not null
order by [Full Name],[Plane Name],Origin,Destination,[Luggage Type]

