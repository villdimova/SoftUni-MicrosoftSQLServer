/*
	Select all students who are teenagers (their age is above or equal to 12). 
	Order them by first name (alphabetically),
	then by last name (alphabetically). Select their first name, last name and their age.
*/

select FirstName,LastName,Age
from students
where Age>=12
order by FirstName,LastName