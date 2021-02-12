/*
	
Find all students who don’t have any subjects. Select their full name. 
The full name is combination of first name, middle name and last name.
Order the result by full name
NOTE: If the middle name is null you have to concatenate the first name and last name separated with single 
*/

select  s.FirstName + IIF(s.MiddleName is null,'',' '+s.MiddleName)+' '+ s.LastName as FullName
from Students s
 left join StudentsSubjects ss on ss.StudentId=s.Id
 where ss.Id  is null
 order by FullName

