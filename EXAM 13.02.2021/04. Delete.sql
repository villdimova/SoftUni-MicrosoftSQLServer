delete
RepositoriesContributors 
where RepositoryId=(select id from repositories where
Name= 'Softuni-Teamwork')

delete
Issues 
where RepositoryId=(select id from repositories where
Name= 'Softuni-Teamwork')
