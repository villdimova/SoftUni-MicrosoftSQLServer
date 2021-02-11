/*
	

*/

SELECT f.ProductId,
		f.Rate,
		f.Description,
		f.CustomerId,
		c.Age,
		c.Gender
FROM Feedbacks f
JOIN Customers c ON f.CustomerId=c.Id
WHERE Rate<5.0
ORDER BY ProductId DESC,Rate