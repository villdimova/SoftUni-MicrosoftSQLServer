/*
Create a view named v_UserWithCountries which selects all customers with their countries.
Required columns:
•	CustomerName – first name plus last name, with space between them
•	Age
•	Gender
•	CountryName
*/


CREATE  TRIGGER tr_DeleteProducts ON Products   INSTEAD OF DELETE
AS
BEGIN
 
	 DECLARE @IdDeletedProduct INT=(SELECT Id FROM Products WHERE Id IN(SELECT ID FROM deleted))
 
	 DELETE FROM ProductsIngredients
	 WHERE ProductId=@IdDeletedProduct

	 DELETE FROM Feedbacks
	 WHERE ProductId=@IdDeletedProduct
	 END

	 DELETE FROM Products
	 WHERE Id=@IdDeletedProduct

	 DELETE FROM Products WHERE Id = 7