select concat(p.FirstName,' ', p.LastName)as [Full Name],
			f.Origin,
			f.Destination
from Passengers p 
join Tickets t on t.PassengerId=p.Id
join Flights f on t.FlightId=f.Id
order by [Full Name],Origin,Destination