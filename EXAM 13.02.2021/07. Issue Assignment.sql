select i.id,
		concat(u.Username,' : ',i.Title) as IssueAssignee
from Issues i
join users u on u.Id=i.AssigneeId
order by i.id desc,IssueAssignee