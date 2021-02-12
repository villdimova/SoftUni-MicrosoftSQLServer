/*
Find all items and information whether and what forbidden game types they have. 
Display item name, price, min level and forbidden game type. Display all items. 
Sort the results by game type in descending order, then by item name in ascending order.
Submit your query statement as Prepare DB & run queries in Judge.
*/

select i.Name,
		i.Price,
		i.MinLevel,
		gt.Name
from items i
left join GameTypeForbiddenItems gtfi on gtfi.ItemId=i.Id
left  join GameTypes gt on gt.Id=gtfi.GameTypeId
 order by gt.Name desc,i.Name