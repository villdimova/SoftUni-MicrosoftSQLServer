update StudentsSubjects
set grade=6.00
where SubjectId in(1,2) and (grade>=5.50 and grade<6.00)