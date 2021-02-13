select id,name,Size
from files
where Size>1000 and Name like '%html%'
order by size desc, id,Name