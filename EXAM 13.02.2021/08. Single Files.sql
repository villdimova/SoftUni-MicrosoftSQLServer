declare @parentsId table(parentId int not null)
insert into @parentsId
select distinct isnull(fp.id,0)
from files f
left join files fp on f.ParentId=fp.Id

select id,name,concat(size,'KB')as Size
from files
where id  not in (select parentId 
from @parentsId)
order by id,name,size desc