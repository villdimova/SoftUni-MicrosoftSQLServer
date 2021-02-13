create  function udf_AllUserCommits(@username varchar(30))
returns int 
as
begin 

	declare @count int=(select count(*)
					from users u 
					left join commits c on c.ContributorId=u.Id
					where Username=@username and c.id is not null
					group by u.id)

	if (@count is null)
	return 0

	return @count
	
end