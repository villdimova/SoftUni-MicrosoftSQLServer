/*
	
*/

create function udf_ExamGradesToUpdate(@studentId int, @grade decimal(3,2))
returns nvarchar(max)
as
begin
	
	declare @student int= (select id from Students where Id=@studentId)

	if(@student is null)
	return 'The student with provided id does not exist in the school!'


	if(@grade>6)
	return'Grade cannot be above 6.00!'
	

	declare @studentsGradesToBeChanged table
	(studentId int not null)
	insert into @studentsGradesToBeChanged
	select ExamId from StudentsExams where StudentId=@studentId and(Grade between (@grade) and (@grade+0.50))

	declare @count int=(select count(*) from @studentsGradesToBeChanged)
	declare @firtsName nvarchar(20)= (select firstname from Students where id=@studentId)

	return concat('You have to update ', @count,' grades for the student ',@firtsName)

end

--You have to update {count} grades for the student {student first name}”

SELECT dbo.udf_ExamGradesToUpdate(12, 6.20)

SELECT dbo.udf_ExamGradesToUpdate(12, 5.50)

SELECT dbo.udf_ExamGradesToUpdate(121, 5.50)

