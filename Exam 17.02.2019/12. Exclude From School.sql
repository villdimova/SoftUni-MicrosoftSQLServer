/*
	Create a user defined stored procedure, named usp_ExcludeFromSchool(@StudentId), 
	that receives a student id and attempts to delete the current student.
	A student will only be deleted if all of these conditions pass:
•	If the student doesn’t exist, then it cannot be deleted. Raise an error with the message
“This school has no student with the provided id!”
If all the above conditions pass, delete the student and ALL OF HIS REFERENCES!

*/

create procedure usp_ExcludeFromSchool(@StudentId int)
as
	begin

	declare @studentForDelete int=(select Id from Students where id=@StudentId)

	if(@studentForDelete is null)
	throw 50001,'This school has no student with the provided id!',1

	delete StudentsTeachers
	where StudentId=@StudentId

	delete StudentsSubjects
	where StudentId=@StudentId

	delete StudentsExams
	where StudentId=@StudentId

	
	delete students 
	where Id=@StudentId

	end

select * from StudentsTeachers
where StudentId=1

select * from StudentsSubjects
where StudentId=1

select *from
StudentsExams
where StudentId=1

select * from 
students 
where Id=1
EXEC usp_ExcludeFromSchool 1
SELECT COUNT(*) FROM Students

EXEC usp_ExcludeFromSchool 301