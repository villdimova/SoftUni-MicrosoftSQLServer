select top(5)
r.Id,
r.Name,
COUNT(*) as Commits
from 
repositories r
 join Commits c on c.RepositoryId=r.Id
 join RepositoriesContributors rc on rc.RepositoryId=r.Id
 join Users u on u.Id=rc.ContributorId
 join Commits com on com.Id=rc.ContributorId
 group by r.id,r.Name
 order by Commits desc