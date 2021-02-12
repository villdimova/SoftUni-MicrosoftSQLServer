/*
	For each country in the database, display the number of rivers passing through that country and 
	the total length of these rivers.
	When a country does not have any river, display 0 as rivers count and as total length.
	Sort the results by rivers count (from largest to smallest), then by total length (from largest to smallest),
	then by country alphabetically. 
	Submit your query statement as Prepare DB & run queries in Judge.
*/

select c.CountryName,
		cont.ContinentName,
		isnull(COUNT(r.Id),0) as RiversCount,
		isnull(sum(r.Length),0) as TotalLength
from Countries c
left join CountriesRivers cr on cr.CountryCode=c.CountryCode
left join Rivers r on r.Id=cr.RiverId
left join continents cont on cont.ContinentCode=c.ContinentCode
group by c.CountryCode, CountryName,cont.ContinentName
order by RiversCount desc,TotalLength desc,CountryName
