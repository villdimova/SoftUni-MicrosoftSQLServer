SELECT Peaks.PeakName,
	   Rivers.RiverName,
	   LOWER(Peaks.PeakName)+LOWER(RIGHT(Rivers.RiverName,(LEN(Rivers.RiverName)-1))) AS Mix
FROM Peaks 
JOIN Rivers
ON LEFT(Rivers.RiverName,1)=RIGHT(Peaks.PeakName,1)
ORDER BY Mix

