/*
Select all planes with their name, seats count and passengers count.
Order the results by passengers count (descending), plane name (ascending) and seats (ascending) 
*/

select pl.Name,
		pl.Seats,
		(count(p.Id))as[Passengers Count]
from planes pl
left join flights f on f.PlaneId=pl.Id
left join Tickets t on t.FlightId=f.Id
left join Passengers p on p.Id=t.PassengerId
GROUP BY pl.Id,pl.Name,pl.Seats
order by [Passengers Count] desc,pl.Name,pl.Seats

