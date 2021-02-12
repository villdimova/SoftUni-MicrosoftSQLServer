/*

*/

select u.Username as [Username], 
       g.Name as [Game], 
       MAX(c.Name) AS [Character], 
       SUM(si.Strength) + MAX(sgt.Strength) + MAX(sc.Strength) AS [Strength], 
       SUM(si.Defence) + MAX(sgt.Defence) + MAX(sc.Defence) AS [Defence], 
       SUM(si.Speed) + MAX(sgt.Speed) + MAX(sc.Speed) AS [Speed], 
       SUM(si.Mind) + MAX(sgt.Mind) + MAX(sc.Mind) AS [Mind], 
       SUM(si.Luck) + MAX(sgt.Luck) + MAX(sc.Luck) AS [Luck]
from Users as u
     JOIN UsersGames as ug on ug.UserId = u.Id
     JOIN Games as g on g.Id = ug.GameId
     JOIN GameTypes as gt on gt.Id = g.GameTypeId
     JOIN [Statistics] as sgt on sgt.id = gt.BonusStatsId
     JOIN Characters as c on c.Id = ug.CharacterId
     JOIN [Statistics] as sc on sc.id = c.StatisticId
     JOIN UserGameItems as ugi on ugi.UserGameId = ug.Id
     JOIN Items as i on i.Id = ugi.ItemId
     JOIN [Statistics] as si on si.id = i.StatisticId
group by u.Username, 
         g.Name
order by Strength desc, 
         Defence desc, 
         Speed desc, 
         mind desc, 
         Luck desc