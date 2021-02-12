
delete StudentsTeachers 
where TeacherID in(select Id from teachers where Phone LIKE '%72%' )

delete Teachers
where Phone LIKE '%72%'

