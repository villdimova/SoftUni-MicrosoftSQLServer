/*
Select all of the planes, which name contains "tr". Order them by id (ascending),
name (ascending), seats (ascending) and range (ascending).


*/

select*
from Planes
where [Name] LIKE '%tr%'
order by Id,[Name],Seats,Range