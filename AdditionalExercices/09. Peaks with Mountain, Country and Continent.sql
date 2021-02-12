select p.PeakName,
		m.MountainRange,
		c.CountryName,
		cont.ContinentName
from peaks p
join Mountains m on m.Id=p.MountainId
join MountainsCountries mc on mc.MountainId=m.Id
join Countries c on c.CountryCode=mc.CountryCode
join Continents cont on cont.ContinentCode=c.ContinentCode
order by PeakName,c.CountryName