SELECT CustomerID,FirstName,LastName,
LEFT(PaymentNumber,5)+REPLICATE('*',11) AS PaymentNumber
FROM Customers