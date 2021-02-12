/*
	Select all students and the count of teachers each one has. 
*/

select s.FirstName,
		s.LastName,
		COUNT(*)
from Students s
 join StudentsTeachers st on s.Id=st.StudentId
group by s.FirstName,s.LastName