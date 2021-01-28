SELECT s.DepositGroup,
	   s.TotalSum
FROM
(SELECT DepositGroup,
		SUM(DepositAmount) AS TotalSum
FROM WizzardDeposits
WHERE MagicWandCreator='Ollivander family' 
GROUP BY DepositGroup,MagicWandCreator) AS s
WHERE s.TotalSum<150000
ORDER BY s.TotalSum DESC