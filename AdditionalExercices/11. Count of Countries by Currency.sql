/*
	Find the number of countries for each currency. Display three columns: currency code,
	currency description and number of countries. Sort the results by number of countries 
	(from highest to lowest), then by currency description alphabetically. 
	Name the columns exactly like in the table below.
	Submit your query statement as Prepare DB & run queries in Judge.
*/

select cur.CurrencyCode as CurrencyCode,
		cur.Description as Currency,
		COUNT(*)as NumberOfCountries
from Currencies cur
 join Countries c on c.CurrencyCode=cur.CurrencyCode
group by cur.CurrencyCode,cur.Description
order by NumberOfCountries desc,cur.Description
