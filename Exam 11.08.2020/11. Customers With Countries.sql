/*
Create a view named v_UserWithCountries which selects all customers with their countries.
Required columns:
•	CustomerName – first name plus last name, with space between them
•	Age
•	Gender
•	CountryName
*/

CREATE VIEW v_UserWithCountries 
AS

SELECT 	CONCAT(cust.FirstName,' ',cust.LastName) AS CustomerName,
		cust.Age AS Age,
		cust.Gender,
		c.Name as CountryName
FROM Customers cust
LEFT JOIN Countries c ON c.Id=cust.CountryId
order by cust.age
OFFSET 0 ROWS