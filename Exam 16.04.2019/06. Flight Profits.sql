/*

*/

select f.Id,
	sum(t.price) as Price	
from Flights f
join Tickets t on t.FlightId=f.Id
group by f.Id
order by Price desc, f.Id
