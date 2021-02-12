/*
	
 Find top 10 students, who have highest average grades from the exams.
Format the grade, two symbols after the decimal point.
Order them by grade (descending), then by first name (ascending), then by last name (ascending)

*/

select top(10)
		s.FirstName,
		s.LastName,
		FORMAT((AVG(se.Grade)),'f2') as AvgGrade
from Students s
 join StudentsExams se on se.StudentId=s.Id
 group by StudentId,FirstName,LastName
 order by AvgGrade desc

