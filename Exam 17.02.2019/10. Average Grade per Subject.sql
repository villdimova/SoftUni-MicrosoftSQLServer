/*
	
Find all students who don’t have any subjects. Select their full name. 
The full name is combination of first name, middle name and last name.
Order the result by full name
NOTE: If the middle name is null you have to concatenate the first name and last name separated with single 
*/

select s.Name,
		avg(ss.Grade) as AverageGrade
from
Subjects s 
 join StudentsSubjects ss on ss.SubjectId=s.Id
group by s.Id,s.Name
order by s.id

