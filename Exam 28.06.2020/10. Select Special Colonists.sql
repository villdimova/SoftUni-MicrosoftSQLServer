/*
Find all colonists and their job during journey with rank 2. 
Keep in mind that all the selected colonists with rank 2 must be the oldest ones. 
You can use ranking over their job during their journey.
Required Columns
•	JobDuringJourney
•	FullName
•	JobRank


SELECT i.ProductID, p.Name, i.LocationID, i.Quantity  
    ,RANK() OVER   
    (PARTITION BY i.LocationID ORDER BY i.Quantity DESC) AS Rank  
*/



SELECT s.JobDuringJourney,
		s.FullName,
		s.JobRank
FROM
(SELECT tc.JobDuringJourney as JobDuringJourney ,
		c.FirstName+' '+c.LastName as FullName,
		RANK() OVER (PARTITION BY tc.JobDuringJourney ORDER BY c.Birthdate) as JobRank
FROM TravelCards tc
left JOIN Colonists c ON tc.ColonistId=c.Id
left JOIN Journeys j ON j.Id=tc.Id) AS s
WHERE JobRank=2


