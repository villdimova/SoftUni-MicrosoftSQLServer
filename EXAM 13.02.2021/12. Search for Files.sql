create procedure usp_SearchForFiles(@fileExtension varchar(20))
as
begin
		declare @fileInfo table 
		(id int not null, name varchar(100) not null,Size decimal(18,2) not null)
		
		insert into @fileInfo
		select id,name, size
		from files
		where name like '%'+@fileExtension

		select id as Id,name as Name,concat(size,'KB') as Size
		from 
		@fileInfo
		order by id , name, size desc

end