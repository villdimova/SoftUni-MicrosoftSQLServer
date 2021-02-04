CREATE PROC usp_GetHoldersWithBalanceHigherThan(@money MONEY) 
AS
SELECT 
		ah.FirstName,
		ah.LastName
FROM Accounts a
JOIN AccountHolders ah ON a.AccountHolderId=ah.Id
GROUP BY a.AccountHolderId,ah.FirstName,ah.LastName
HAVING SUM(Balance)>@money
ORDER BY ah.FirstName,ah.LastName

EXEC usp_GetHoldersWithBalanceHigherThan 500000