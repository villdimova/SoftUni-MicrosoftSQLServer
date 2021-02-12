select p.PeakName,
	m.MountainRange,
	p.Elevation
from peaks p
join Mountains m on m.Id=p.MountainId
order by Elevation desc,p.PeakName, 