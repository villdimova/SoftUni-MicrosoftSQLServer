CREATE FUNCTION ufn_CashInUsersGames(@gameName VARCHAR(50))
RETURNS TABLE
AS
RETURN
(

SELECT SUM(s.Cash) AS TotalCash
FROM
(SELECT ug.Cash,
ROW_NUMBER() OVER (ORDER BY ug.Cash DESC)AS RowNumber
FROM Games g
JOIN UsersGames ug ON ug.GameId=g.Id
WHERE Name=@gameName)AS s
WHERE s.RowNumber%2=1	
)
