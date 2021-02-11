/*
Select all people who don't have tickets. Select their first name, last name and age .
Order them by age (descending), 
first name (ascending) and last name (ascending).
*/

select	p.FirstName, 
		p.LastName,
		p.Age
from Passengers p 
left join Tickets t on t.PassengerId=p.Id
where t.Id is null
order by p.Age desc,p.FirstName,p.LastName