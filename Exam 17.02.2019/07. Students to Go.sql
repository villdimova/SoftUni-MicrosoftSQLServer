/*
	Find all students, who have not attended an exam. Select their full name (first name + last name).
Order the results by full name (ascending).
 
*/

select CONCAT(FirstName,' ', LastName) as Fullname
from Students s
left join StudentsExams se on se.StudentId=s.Id
where se.StudentId is null
order by Fullname