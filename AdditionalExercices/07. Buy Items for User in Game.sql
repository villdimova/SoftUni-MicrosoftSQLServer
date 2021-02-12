/*
	

*/
declare @selectedItems table(itemId int not null) 
insert into @selectedItems
select id
from Items
where Name in  ('Blackguard',
				'Bottomless Potion of Amplification',
				'Eye of Etlich (Diablo III)', 
				'Gem of Efficacious Toxin', 
				'Golden Gorget of Leoric',
				'Hellfire Amulet')

declare @totalSum money=(select sum(price)
from Items i
join @selectedItems si on si.itemId=i.Id
where i.Id=si.itemId)

declare @AlexId int=(select id
from users 
where username='Alex')

declare @gameId int=(select id
from games
where name='Edinburgh')

update UsersGames
set cash-=@totalSum
where userId=@AlexId and GameId=@gameId

declare @userGameId int =(select * 
from UsersGames
where userId=@AlexId and GameId=@gameId
)

insert into UserGameItems(ItemId,UserGameId) 
values
((select id from items where name='Blackguard'),@userGameId),
((select id from items where name='Bottomless Potion of Amplification'),@userGameId),
((select id from items where name='Eye of Etlich (Diablo III)'),@userGameId),
((select id from items where name='Hellfire Amulet'),@userGameId),
((select id from items where name='Gem of Efficacious Toxin'),@userGameId),
((select id from items where name='Golden Gorget of Leoric'),@userGameId)

select u.Username, g.Name, ug.Cash, i.Name
FROM Users u
         JOIN UsersGames ug on u.Id = UG.UserId
         JOIN Games g on g.Id = UG.GameId
         JOIN UserGameItems ugi on ug.Id = ugi.UserGameId
         JOIN Items i on i.Id = ugi.ItemId
where g.Name = 'Edinburgh'
order by  i.Name

