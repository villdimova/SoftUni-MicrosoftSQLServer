select u.Username,
		avg(f.size) as size

from users u 
left join commits c on c.ContributorId=u.Id
left join issues i on i.AssigneeId=u.Id
left join files f on c.Id=f.CommitId
where (c.id is not null and f.Id is not null) 
group by u.id,u.Username
order by size desc
