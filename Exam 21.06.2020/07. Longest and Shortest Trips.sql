

SELECT	atr.AccountId,
		a.FirstName+' '+a.LastName AS FullName,
		MAX(DATEDIFF(DAY,t.ArrivalDate,t.ReturnDate)) AS LongestTrip,
		MIN(DATEDIFF(DAY,t.ArrivalDate,t.ReturnDate)) AS ShortestTrip
FROM Accounts a
 JOIN AccountsTrips atr ON a.Id=atr.AccountId
 JOIN Trips t ON t.Id=atr.TripId
 WHERE t.CancelDate IS NULL AND a.MiddleName IS NULL	
GROUP BY atr.AccountId,A.FirstName,A.LastName
ORDER BY LongestTrip DESC, ShortestTrip


