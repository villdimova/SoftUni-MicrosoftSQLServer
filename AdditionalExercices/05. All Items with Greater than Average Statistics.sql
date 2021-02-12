/*
Find all items with statistics larger than average. Display only items that have Mind,
Luck and Speed greater than average Items mind, luck and speed. 
Sort the results by item names in alphabetical order. 
Submit your query statement as Prepare DB & run queries in Judge.
*/

select i.Name,
		i.Price,
		i.MinLevel,
		s.Strength,
		s.Defence,
		s.Speed,
		s.Luck,
		s.Mind
from items i 
left join [Statistics] s on i.StatisticId=s.Id
where s.Luck>(select avg(Luck)from [Statistics])and
	s.Mind>(select avg(Mind)from [Statistics])and
	s.Speed>(select avg(Speed)from [Statistics])
	order by i.Name

